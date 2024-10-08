import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/features/item/application/use_cases/read_item.dart';
import 'package:todo_turno/features/shift/application/use_cases/create_shift.dart';
import 'package:todo_turno/presentation/provider/bottom_navigation_bar_provider/bottom_navigation_bar_provider.dart';
import 'package:todo_turno/presentation/views/add/qr_scanner_view.dart';
import 'package:todo_turno/presentation/widgets/number_selection.dart';
import '../../../features/item/domain/entities/item.dart';
import '../../../features/shift/domain/entities/shift.dart';
import '../../../features/user/application/provider/user_provider.dart';
import '../../provider/views_list_provider/views_list_provider.dart';
import '../../widgets/count_douwn_timer.dart';

class ItemView extends StatefulWidget {
  final String? itemId;
  final Item? itemProvided;

  const ItemView({super.key, this.itemId, this.itemProvided})
  : assert(itemId != null || itemProvided != null, 'You must pass wither itemId or itemProvided.'),
  assert(!(itemId != null && itemProvided != null), 'You cannot pass both itemId and itemProvided at the same time.');

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  final ReadItem readItem = GetIt.instance<ReadItem>();
  final CreateShift createShift = GetIt.instance<CreateShift>();
  Item? item;

  @override
  void initState() {
    super.initState();
    if(widget.itemId != null) {
      unawaited(readItem.call(itemId: widget.itemId!).then((value) {
        setState(() {
          item = value;
        });
      }));
    }else{
      item = widget.itemProvided;
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final BottomNavigationBarProvider bottomNavigationBarProvider = Provider.of<BottomNavigationBarProvider>(context);
    final ViewsListProvider viewsListProvider =
    Provider.of<ViewsListProvider>(context, listen: false);
    if (item == null) {
      return const Scaffold(
          body: Center(child: CircularProgressIndicator(strokeWidth: 2)));
    }

    final Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black,
          expandedHeight: size.height * 0.7,
          foregroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              viewsListProvider.setQrScannerView = const QrScannerView();
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
          flexibleSpace: FlexibleSpaceBar(
            titlePadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            background: Stack(
              children: [
                SizedBox.expand(
                  child: Image.network(
                    item!.mainImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                const _CustomGradient(
                  begin: Alignment.topLeft,
                  stops: [0.0, 0.3],
                  colors: [
                    Colors.black87,
                    Colors.transparent,
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (context, index) => _ItemDetails(
                item: item!,
                onSubmit: (peopleInShift) async {
                  /**** Este bloque de codigo lo tengo que encapsular en un flujo de pantallas sincrona****/
                  final Shift shiftCreated = await createShift
                      .call(
                      itemId: item!.id,
                      peopleInShift: peopleInShift);

                  userProvider.getUser!.shiftList.add(shiftCreated);
                  /**** En la que si el proceso es exitoso, mostrara una animacion de confirmacion en caso contrario mostrara una pantalla estatica de error ****/

                  bottomNavigationBarProvider.setPos = 1;
                  viewsListProvider.setQrScannerView = const QrScannerView();
                },
              ),
              childCount: 1),
        )
      ],
    );
  }
}

class _ItemDetails extends StatefulWidget {
  final Item item;
  final Function(int) onSubmit;

  const _ItemDetails({required this.item, required this.onSubmit});

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<_ItemDetails> {
  bool isExpanded = false;
  bool isLoading = false;
  int peopleInShift = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 40),
      child: Column(
        children: [
          mainInformation(),
          const Divider(),
          const Text('Tiempo de espera Aprox',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.green)),
          CountdownTimer(
            initialDuration: widget.item.currentWaitingDuration,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 26,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Valoracion promedio'),
              RatingStars(value: widget.item.rating ?? 0)
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Personas'),
              NumberSelection(
                onChanged: (value) => peopleInShift = value,
              )
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => widget.onSubmit.call(peopleInShift),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(500),
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColorDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              elevation: 5,
            ),
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text(
              'Agregar Turno!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mainInformation() {
    final Size size = MediaQuery.of(context).size;

    const int maxDescriptionLength = 100;
    final String description = widget.item.description;
    final String displayText = description.length > maxDescriptionLength
        ? (isExpanded ? description : '${description.substring(0, maxDescriptionLength)}...')
        : description;

    return isExpanded
        ? _buildExpandedContent(displayText)
        : _buildCollapsedContent(displayText, size);
  }

  Widget _buildExpandedContent(String displayText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.item.name,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          displayText,
          textAlign: TextAlign.center,
        ),
        if (widget.item.description.length > 100) _buildReadMoreButton(),
      ],
    );
  }

  Widget _buildCollapsedContent(String displayText, Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isExpanded) ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            widget.item.secondaryImagePath ?? widget.item.mainImagePath,
            width: size.width * 0.3,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: (size.width - 40) * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.name,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(displayText),
              if (widget.item.description.length > 100) _buildReadMoreButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReadMoreButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Text(
        isExpanded ? 'Leer menos' : 'Leer más',
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}

class _CustomGradient extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGradient(
      {this.begin = Alignment.centerLeft,
        this.end = Alignment.centerRight,
        required this.stops,
        required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: begin, end: end, stops: stops, colors: colors))),
    );
  }
}
