import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/features/business/application/dto/RegisterBusinessDTO.dart';
import 'package:todo_turno/features/paymentInfo/application/dto/RegisterPaymentInfoDTO.dart';
import '../../../features/user/application/dto/RegisterUserDTO.dart';
import '../../../features/user/application/use_cases/register_user.dart';
import '../../../features/user/domain/entities/user.dart';
import '../../provider/views_list_provider/views_list_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/custom_input_widget.dart';
import 'login_user_view.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({super.key});

  @override
  _RegisterUserViewState createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {
  final _registerFormKey = GlobalKey<FormState>();

  // Controllers para los campos de texto
  //User
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController =
      TextEditingController();
  UserRole userRoleView = UserRole.REGULAR_USER;

  //PaymentInfo
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cardTypeController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  //Business
  final TextEditingController _cifBusinessController = TextEditingController();
  final TextEditingController _nameBusinessController = TextEditingController();
  final TextEditingController _phoneBusinessController =
      TextEditingController();
  final TextEditingController _addressBusinessController =
      TextEditingController();
  final TextEditingController _emailBusinessController =
      TextEditingController();

  final RegisterUser registerUser = GetIt.instance<RegisterUser>();
  bool isLoading = false;
  Image? image;
  String? imageBase65;

  void changeView(BuildContext context, Widget view) {
    final ViewsListProvider viewsListProvider =
        Provider.of<ViewsListProvider>(context, listen: false);
    viewsListProvider.setProfileView = view;
  }

  Future<void> _registerUser(BuildContext context) async {
    if (_registerFormKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      RegisterPaymentInfoDTO registerPaymentInfoDTO = RegisterPaymentInfoDTO(
          cardNumber: _cardNumberController.text,
          cardHolderName: _cardHolderNameController.text,
          expiryDate: _expiryDateController.text,
          cardType: _cardTypeController.text,
          cvv: _cvvController.text);
      RegisterBusinessDTO registerBusinessDTO = RegisterBusinessDTO(
        cif: _cifBusinessController.text,
        name: _nameBusinessController.text,
        imageBase64: imageBase65,
        phone: _phoneBusinessController.text,
        address: _addressBusinessController.text,
        email: _emailBusinessController.text,
      );
      RegisterUserDTO registerUserDTO = RegisterUserDTO(
        name: _nameController.text,
        nickName: _nickNameController.text,
        email: _emailController.text,
        phoneNumber: _phoneNumberController.text,
        password: _passwordController.text,
        userRole: userRoleView.name,
        paymentInfoList: [registerPaymentInfoDTO],
        business: registerBusinessDTO,
      );
      final user = await registerUser.call(registerUserDTO: registerUserDTO);
      setState(() {
        isLoading = false;
      });
      changeView(context, const LoginUserView());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bienvenido a NoWait ${user.nickName}'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nickNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                key: _registerFormKey,
                child: Column(
                  children: [
                    _buildColumnForm(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumnForm(BuildContext context) {
    List<Widget> inputs = [
      SegmentedButton(
        segments: const <ButtonSegment<UserRole>>[
          ButtonSegment<UserRole>(
              value: UserRole.REGULAR_USER, icon: Icon(Icons.person)),
          ButtonSegment<UserRole>(
              value: UserRole.MANAGER, icon: Icon(Icons.badge)),
          ButtonSegment<UserRole>(
              value: UserRole.ADMIN, icon: Icon(Icons.admin_panel_settings))
        ],
        selected: <UserRole>{userRoleView},
        onSelectionChanged: (Set<UserRole> newSelection) {
          setState(() {
            userRoleView = newSelection.first;
          });
        },
      ),
      CustomInputWidget(
        hintText: AppLocalizations.of(context)!.name,
        icon: Icons.person,
        controller: _nameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'El campo no puede estar vacío';
          } else if (value.length < 5) {
            return 'El campo debe tener como mínimo 5 caracteres';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: AppLocalizations.of(context)!.nickname,
        icon: Icons.tag_faces,
        controller: _nickNameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'El campo no puede estar vacío';
          } else if (value.length < 5) {
            return 'El campo debe tener como mínimo 5 caracteres';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: AppLocalizations.of(context)!.phone,
        icon: Icons.phone,
        keyboardType: TextInputType.phone,
        controller: _phoneNumberController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'El número telefónico es obligatorio';
          }
          if (value.length != 9) {
            return 'El número debe tener 9 dígitos';
          }
          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
            return 'El número debe contener solo dígitos';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: AppLocalizations.of(context)!.email,
        icon: Icons.email,
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'El correo electrónico es obligatorio';
          }
          return null;
        },
      ),
      CustomInputWidget(
        obscureText: true,
        hintText: AppLocalizations.of(context)!.passwordHint,
        icon: Icons.password,
        keyboardType: TextInputType.visiblePassword,
        controller: _passwordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'La contraseña es obligatoria';
          }
          if (value.length < 8) {
            return 'La contraseña debe tener al menos 8 caracteres';
          }
          if (!RegExp(r'[A-Z]').hasMatch(value)) {
            return 'Falta una mayúscula';
          }
          if (!RegExp(r'[0-9]').hasMatch(value)) {
            return 'Falta un número';
          }
          if (!RegExp(r'[!@#&*~`%^()_=+{};:.,"]').hasMatch(value)) {
            return 'Falta un carácter especial';
          }
          return null;
        },
      ),
      CustomInputWidget(
        obscureText: true,
        hintText: AppLocalizations.of(context)!.repeatPasswordHint,
        icon: Icons.password,
        keyboardType: TextInputType.visiblePassword,
        controller: _passwordRepeatController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'La contraseña es obligatoria';
          }
          if (value.length < 8) {
            return 'La contraseña debe tener al menos 8 caracteres';
          }
          if (!RegExp(r'[A-Z]').hasMatch(value)) {
            return 'Falta una mayúscula';
          }
          if (!RegExp(r'[0-9]').hasMatch(value)) {
            return 'Falta un número';
          }
          if (!RegExp(r'[!@#&*~`%^()_=+{};:.,"]').hasMatch(value)) {
            return 'Falta un carácter especial';
          }
          if (value != _passwordController.text) {
            return 'Las constraseñas no coinciden';
          }
          return null;
        },
      ),
    ];
    List<Widget> paymentInfoInputs = [
      CustomInputWidget(
        hintText: 'Numero de tarjeta',
        icon: Icons.numbers,
        keyboardType: TextInputType.number,
        controller: _cardNumberController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: 'Nombre del propietario',
        icon: Icons.person,
        keyboardType: TextInputType.name,
        controller: _cardHolderNameController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: 'Fecha de vencimiento',
        icon: Icons.date_range_sharp,
        keyboardType: TextInputType.datetime,
        controller: _expiryDateController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: 'Tipo de tarjeta',
        icon: Icons.credit_card_outlined,
        keyboardType: TextInputType.name,
        controller: _cardTypeController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: 'Cvv',
        icon: Icons.security,
        keyboardType: TextInputType.number,
        controller: _cvvController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
    ];

    List<Widget> businessInputs = [
      CustomInputWidget(
        hintText: 'Cif',
        icon: Icons.add_business,
        keyboardType: const TextInputType.numberWithOptions(),
        controller: _cifBusinessController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: 'Nombre del negocio',
        icon: Icons.business,
        keyboardType: TextInputType.name,
        controller: _nameBusinessController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: 'Teléfono del negocio',
        icon: Icons.phone,
        keyboardType: TextInputType.phone,
        controller: _phoneBusinessController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          if (value.length != 9) {
            return 'El número debe tener 9 dígitos';
          }
          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
            return 'El número debe contener solo dígitos';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: 'Dirección del negocio',
        icon: Icons.location_on,
        keyboardType: TextInputType.streetAddress,
        controller: _addressBusinessController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
      CustomInputWidget(
        hintText: 'Correo Electronico del negocio',
        icon: Icons.email,
        keyboardType: TextInputType.emailAddress,
        controller: _emailBusinessController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () async {
          final ImagePicker picker = ImagePicker();
          XFile? imageXFile =
              await picker.pickImage(source: ImageSource.gallery);
          if (imageXFile != null) {
            setState(() {
              image = Image.file(File(imageXFile.path));
            });
          } else {
            print('No se seleccionó ninguna imagen');
          }
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
    ];

    List<Widget> additionalInputs = [
      ExpansionTile(
        title: Text('Información de pago'),
        children: widgetSpaceBuilder(paymentInfoInputs, 20).children,
      ),
      ExpansionTile(
        title: Text('Información de negocio'),
        children: widgetSpaceBuilder(businessInputs, 20).children,
      )
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'AQUI DEBE HABER UNA IMAGEN\nBONITA DE UN SAPITO QUE\nREACCIONE AL TAP DEL USUARIO\nde Luis para Luis\n:)',
          textAlign: TextAlign.center,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widgetSpaceBuilder(inputs, 20),
            if (userRoleView != UserRole.REGULAR_USER)
              widgetSpaceBuilder(additionalInputs, 20),
            const SizedBox(height: 20), // Espacio antes del botón
            ElevatedButton(
              onPressed: () => _registerUser(context),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(500),
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColorDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                elevation: 5, // Sombra del botón
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
            const SizedBox(height: 10),
            const Text(
              'Ya tienes una cuenta?',
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                changeView(context, const LoginUserView());
              },
              child: const Text('INICIA SESION!',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            )
          ],
        )
      ],
    );
  }

  Column widgetSpaceBuilder(List<Widget> listOfWidgets, double spaceBetween) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...List.generate(
          listOfWidgets.length,
          (index) {
            return Column(
              children: [
                listOfWidgets[index],
                if (index < listOfWidgets.length - 1)
                  SizedBox(height: spaceBetween),
              ],
            );
          },
        )
      ],
    );
  }
}
