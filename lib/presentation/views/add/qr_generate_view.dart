import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_turno/features/business/application/dto/add_item_request_DTO.dart';
import 'package:todo_turno/features/item/domain/entities/item.dart';
import '../../../features/business/application/use_cases/add_item.dart';
import '../../../features/image/application/use_cases/take_photo.dart';
import '../../../features/image/domain/entities/image_data.dart';
import '../../../features/item/application/dto/create_item_request_DTO.dart';
import '../../../features/user/application/provider/user_provider.dart';
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

  final TakePhoto takePhoto = TakePhoto();
  late File imageFile;
  late ImageData imageData;
  Image? image;

  final AddItem addItem = GetIt.instance<AddItem>();

  Future<void> _addItem(BuildContext context) async {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    if (_registerFormKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      String? businessId = userProvider.getBusinessId();
      if (businessId != null) {
        CreateItemRequestDTO createItemRequestDTO = CreateItemRequestDTO(
            name: _nameController.text,
            description: _descriptionController.text,
            peoplePerShift: int.parse(_descriptionController.text),
            mainImagePath: '',
            secondaryImagePath: '',
            durationPerShifts: _durationPerShiftInMinutes,
            status: itemStatusView.name);
        AddItemRequestDTO addItemRequestDTO =
            AddItemRequestDTO(businessId, createItemRequestDTO);

        Item item = await addItem.call(addItemRequestDTO: addItemRequestDTO);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> inputs = [
      CustomInputWidget(
        hintText: 'Nombre del item',
        icon: const Icon(Icons.emoji_objects_outlined),
        controller: _nameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'El campo no puede estar vacío';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: 'Descripción del item',
        icon: const Icon(Icons.description),
        controller: _descriptionController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'El campo no puede estar vacío';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: 'Número de personas por turno',
        icon: const Icon(Icons.group),
        controller: _peoplePerShiftController,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'El campo no puede estar vacío';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: 'Duración por turno',
        icon: const Icon(Icons.timelapse),
        controller: _durationPerShiftsController,
        customKeyboardType: CustomKeyboardType.DURATION,
        onDurationChanged: (int duration) {
          _durationPerShiftInMinutes = duration;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'El campo no puede estar vacío';
          }
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () async {
          imageFile = await takePhoto.call(ImageSource.gallery);
          setState(() {
            image = Image.file(imageFile);
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
                'Agregar imagen',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
      Container(
        child: image,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Agrupando los botones en un contenedor
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

    return Scaffold(
      body: AbsorbPointer(
        absorbing: isLoading,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 55, bottom: 55),
            child: SingleChildScrollView(
              child: Form(
                // El hijo del SingleChildScrollView es el Form
                key: _registerFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenerateStaceBetweenWidget.widgetSpaceBuilder(inputs, 20),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _addItem(context),
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
    );
  }
}
