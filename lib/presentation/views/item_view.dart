import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_turno/features/item/application/use_cases/read_item.dart';
import '../../features/item/domain/entities/item.dart';

class ItemView extends StatefulWidget {
  final String itemId;

  const ItemView({super.key, required this.itemId});

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  final ReadItem readItem = GetIt.instance<ReadItem>();
  Item? item;

  @override
  void initState() {
    super.initState();
    unawaited(readItem.call(itemId: widget.itemId).then((value) {
      setState(() {
        item = value;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: (){},
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
              (context, index) => _ItemDetails(item: item!),
              childCount: 1),
        )
      ],
    );
  }
}

class _ItemDetails extends StatefulWidget {
  final Item item;

  const _ItemDetails({required this.item});

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<_ItemDetails> {
  bool isExpanded = false;
  bool isLoading = false;
  late Timer _timer;
  Duration _currentDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _currentDuration = widget.item.currentWaitingDuration;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentDuration = _currentDuration - const Duration(seconds: 1);
        if (_currentDuration.inSeconds <= 0) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 40),
      child: Column(
        children: [
          mainInformation(),
          const Divider(),
          const Text('Tiempo de espera Aprox', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.green)),
          Text(_formatDuration(_currentDuration), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26, color: Theme.of(context).primaryColorDark),),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Valoracion promedio'), RatingStars(value: widget.item.rating ?? 0)],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(500),
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColorDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Bordes redondeados
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              elevation: 5, // Sombra del botón
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

  String _formatDuration(Duration duration) {
    final int minutes = duration.inMinutes % 60;
    final int hours = duration.inHours;
    final int seconds = duration.inSeconds % 60;
    return '${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(seconds)}';
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  Widget mainInformation() {
    final Size size = MediaQuery.of(context).size;

    const int maxDescriptionLength = 100;

    final String displayText = isExpanded
        ? widget.item.description
        : '${widget.item.description.substring(0, maxDescriptionLength)}...';

    if (isExpanded) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.item.name,
            style: const TextStyle(
                color: Colors.green, fontSize: 24, fontWeight: FontWeight.w900),
          ),
          Text(
            displayText,
            textAlign: TextAlign.center,
          ),
          if (widget.item.description.length > maxDescriptionLength)
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? 'Leer menos' : 'Leer más',
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isExpanded == false
            ? ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            widget.item.secondaryImagePath ?? widget.item.mainImagePath,
            width: size.width * 0.3,
          ),
        )
            : Container(),
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
                    fontWeight: FontWeight.w900),
              ),
              Text(displayText),
              if (widget.item.description.length > maxDescriptionLength)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    isExpanded ? 'Leer menos' : 'Leer más',
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ],
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
