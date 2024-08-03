import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_turno/views/widgets/custom_input_widget.dart';
import '../../../features/user/application/use_cases/register_user.dart';
import '../../widgets/custom_appbar.dart';
import '../abstract_screens/abstract_screen.dart';

class RegisterUserScreen extends AbstractScreen {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends AbstractScreenState<RegisterUserScreen>
    with AbstractScreenMixin {
  final _formKey = GlobalKey<FormState>();

  // Controllers para los campos de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController = TextEditingController();

  RegisterUser registerUser = GetIt.instance<RegisterUser>();

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

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      final user = await registerUser.call(
        name: _nameController.text,
        nickName: _nickNameController.text,
        email: _emailController.text,
        phoneNumber: _phoneNumberController.text,
        password: _passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bienvenido a NoWait ${user.nickName}'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  CustomAppBar appbarWidget() {
    return CustomAppBar(
      actions: () {},
      title: languageProvider.languageSelected.REGISTER_APP_BAR,
    );
  }

  @override
  Widget bodyWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Form(key: _formKey, child: _buildColumnForm()),
    );
  }

  Widget _buildColumnForm() {
    List<Widget> inputs = [
      CustomInputWidget(
        hintText: languageProvider.languageSelected.NAME_HINT,
        icon: Icons.person,
        controller: _nameController,
      ),
      CustomInputWidget(
        hintText: languageProvider.languageSelected.NICKNAME_HINT,
        icon: Icons.tag_faces,
        controller: _nickNameController,
      ),
      CustomInputWidget(
        hintText: languageProvider.languageSelected.PHONE_HINT,
        icon: Icons.phone,
        keyboardType: TextInputType.phone,
        controller: _phoneNumberController,
      ),
      CustomInputWidget(
        hintText: languageProvider.languageSelected.EMAIL_HINT,
        icon: Icons.email,
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
      ),
      CustomInputWidget(
        obscureText: true,
        hintText: languageProvider.languageSelected.PASSWORD,
        icon: Icons.password,
        keyboardType: TextInputType.visiblePassword,
        controller: _passwordController,
      ),
      CustomInputWidget(
        obscureText: true,
        hintText: languageProvider.languageSelected.REPEAR_PASSWORD,
        icon: Icons.password,
        keyboardType: TextInputType.visiblePassword,
        controller: _passwordRepeatController,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...List.generate(
          inputs.length,
          (index) {
            return Column(
              children: [
                inputs[index],
                if (index < inputs.length - 1) const SizedBox(height: 20),
              ],
            );
          },
        ),
        const SizedBox(height: 20), // Espacio antes del botón
        ElevatedButton(
          onPressed: () => _registerUser(),
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(widthOfScreen * 0.8),
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColorDark,
            // Color del texto
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Bordes redondeados
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            // Espaciado interno del botón
            elevation: 5, // Sombra del botón
          ),
          child: Text(
            languageProvider.languageSelected.REGISTER_BUTTON,
            style: TextStyle(
              fontSize: fontSizeSubTitle,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
