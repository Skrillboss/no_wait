import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_turno/features/item/domain/entities/item.dart';
import 'package:todo_turno/presentation/views/add/qr_view.dart';
import '../../../features/business/application/use_cases/add_item.dart';
import '../../../features/image/application/use_cases/compress_file.dart';
import '../../../features/image/application/use_cases/create_photo.dart';
import '../../../features/image/application/use_cases/take_photo.dart';
import '../../../features/image/domain/entities/image_data.dart';
import '../../../features/item/application/dto/item_request_DTO.dart';
import '../../../features/user/application/provider/user_provider.dart';
import '../../provider/views_list_provider/views_list_provider.dart';
import '../../widgets/custom_input_widget.dart';
import '../../widgets/tools/custom_keyboardType.dart';
import '../../widgets/tools/generate_space_between_widget.dart';

class QrGenerateView extends StatefulWidget {
  const QrGenerateView({super.key});

  @override
  State<QrGenerateView> createState() => _QrGenerateViewState();
}

class _QrGenerateViewState extends State<QrGenerateView> {
  final _registerFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _peoplePerShiftController =
      TextEditingController();
  int _durationPerShiftInMinutes = 0;
  final TextEditingController _durationPerShiftsController =
      TextEditingController();
  ItemStatus itemStatusView = ItemStatus.ACTIVE;

  String? qrData;
  bool isLoading = false;

  final CreatePhoto createPhoto = GetIt.instance<CreatePhoto>();
  final TakePhoto takePhoto = TakePhoto();
  late File mainImageCompressFile;
  late File secondaryImageFile;
  late ImageData mainImageData;
  late ImageData secondaryImageData;
  Image? mainImage;
  Image? secondaryImage;

  final AddItem addItem = GetIt.instance<AddItem>();

  Future<void> _addItem(BuildContext context, String businessId,
      ViewsListProvider viewsListProvider) async {
    if (_registerFormKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        mainImageData = await createPhoto.call(fileImage: mainImageCompressFile);
        secondaryImageData =
            await createPhoto.call(fileImage: secondaryImageFile);
      } catch (e) {
        print('========================HA OCURRIDO EL SIGUIENTE ERROR: $e');
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }

      ItemRequestDTO itemRequestDTO = ItemRequestDTO(
          name: _nameController.text,
          description: _descriptionController.text,
          peoplePerShift: int.parse(_peoplePerShiftController.text),
          mainImagePath: mainImageData.displayUrl,
          secondaryImagePath: secondaryImageData.displayUrl,
          durationPerShifts: _durationPerShiftInMinutes,
          status: itemStatusView.name);

      Item item = await addItem.call(businessId: businessId, itemRequestDTO: itemRequestDTO);
      viewsListProvider.setQrScannerView = QrView(item: item);
    }
  }

  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Estás seguro?'),
          content: const Text(
            '¿Deseas salir del formulario? \n ¡Perderas toda la información!',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Continuar'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Salir'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    //TODO: colocar un condicional en caso de no conseguir el identificado del business
    String businessId = userProvider.getBusinessId()!;

    List<Widget> inputs = [
      CustomInputWidget(
        hintText: 'Nombre del item',
        icon: const Icon(Icons.emoji_objects_outlined),
        textController: _nameController,
      ),
      CustomInputWidget(
        hintText: 'Descripción del item',
        icon: const Icon(Icons.description),
        textController: _descriptionController,
        maxLength: 230,
      ),
      CustomInputWidget(
        hintText: 'Número de personas por turno',
        icon: const Icon(Icons.group),
        textController: _peoplePerShiftController,
        keyboardType: TextInputType.number,
      ),
      CustomInputWidget(
        hintText: 'Duración por turno',
        icon: const Icon(Icons.timelapse),
        textController: _durationPerShiftsController,
        customKeyboardType: CustomKeyboardType.DURATION,
        onDurationChanged: (int duration) {
          _durationPerShiftInMinutes = duration;
        },
      ),
      ElevatedButton(
        onPressed: () async {
          File imageWithoutCompress = await takePhoto.call(ImageSource.gallery);
          mainImageCompressFile = await CompressFile.compressAndGetFile(imageWithoutCompress);
          setState(() {
            mainImage = Image.file(mainImageCompressFile);
          });
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromWidth(500),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(10), bottom: Radius.circular(0)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          elevation: 5, // Sombra del botón
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : const Text(
                'Imagen Principal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
      Container(
        child: mainImage,
      ),
      ElevatedButton(
        onPressed: () async {
          secondaryImageFile = await takePhoto.call(ImageSource.gallery);
          setState(() {
            secondaryImage = Image.file(secondaryImageFile);
          });
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromWidth(500),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(10), bottom: Radius.circular(0)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          elevation: 5,
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : const Text(
                'Imagen Secundaria',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
      Container(
        child: secondaryImage,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity, // Ajusta el tamaño según sea necesario
            child: SegmentedButton(
                segments: const <ButtonSegment<ItemStatus>>[
                  ButtonSegment<ItemStatus>(
                      value: ItemStatus.ACTIVE,
                      icon: Icon(Icons.play_circle_filled),
                      label: Text('Activo')),
                ],
                selected: <ItemStatus>{
                  itemStatusView
                },
                onSelectionChanged: (Set<ItemStatus> newSelection) {
                  setState(() {
                    itemStatusView = newSelection.first;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(500),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  elevation: 5,
                ),
                showSelectedIcon: false),
          ),
          Container(
            width: double.infinity,
            child: SegmentedButton(
                segments: const <ButtonSegment<ItemStatus>>[
                  ButtonSegment<ItemStatus>(
                      value: ItemStatus.INACTIVE,
                      icon: Icon(Icons.block),
                      label: Text('Inactivo')),
                ],
                selected: <ItemStatus>{
                  itemStatusView
                },
                onSelectionChanged: (Set<ItemStatus> newSelection) {
                  setState(() {
                    itemStatusView = newSelection.first;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(500),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  elevation: 5,
                ),
                showSelectedIcon: false),
          ),
          Container(
            width: double.infinity,
            child: SegmentedButton(
                segments: const <ButtonSegment<ItemStatus>>[
                  ButtonSegment<ItemStatus>(
                      value: ItemStatus.SUSPENDED,
                      icon: Icon(Icons.pause_circle_filled),
                      label: Text('Suspendido')),
                ],
                selected: <ItemStatus>{
                  itemStatusView
                },
                onSelectionChanged: (Set<ItemStatus> newSelection) {
                  setState(() {
                    itemStatusView = newSelection.first;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(500),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  elevation: 5,
                ),
                showSelectedIcon: false),
          ),
          Container(
            width: double.infinity,
            child: SegmentedButton(
                segments: const <ButtonSegment<ItemStatus>>[
                  ButtonSegment<ItemStatus>(
                      value: ItemStatus.NOSTOCK,
                      icon: Icon(Icons.admin_panel_settings),
                      label: Text('Sin Stock')),
                ],
                selected: <ItemStatus>{
                  itemStatusView
                },
                onSelectionChanged: (Set<ItemStatus> newSelection) {
                  setState(() {
                    itemStatusView = newSelection.first;
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(500),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  elevation: 5,
                ),
                showSelectedIcon: false),
          ),
        ],
      ),
    ];

    final ViewsListProvider viewsListProvider =
        Provider.of<ViewsListProvider>(context, listen: false);

    return Scaffold(
      body: AbsorbPointer(
        absorbing: isLoading,
        child: PopScope<Object?>(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, Object? result) async {
            if (didPop) {
              return;
            }
            final bool shouldPop = await _showBackDialog() ?? false;
            if (context.mounted && shouldPop) {
              viewsListProvider.popQrScannerView();
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.blue],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 55, bottom: 55),
              child: SingleChildScrollView(
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GenerateStaceBetweenWidget.widgetSpaceBuilder(inputs, 20),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () =>
                            _addItem(context, businessId, viewsListProvider),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromWidth(500),
                          foregroundColor: Colors.white,
                          backgroundColor: Theme.of(context).primaryColorDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          elevation: 5,
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                AppLocalizations.of(context)!.registerButton,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
