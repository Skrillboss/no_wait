import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_turno/features/user/application/use_cases/login_user.dart';
import 'package:todo_turno/views/widgets/custom_input_widget.dart';
import '../../widgets/custom_appbar.dart';
import '../abstract_screens/abstract_screen.dart';

class LoginUserScreen extends AbstractScreen {
  const LoginUserScreen({super.key});

  @override
  State<LoginUserScreen> createState() => _LoginUserScreenState();
}

class _LoginUserScreenState extends AbstractScreenState<LoginUserScreen>
    with AbstractScreenMixin {

  final _formKey = GlobalKey<FormState>();

  // Controllers para los campos de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginUser loginUser = GetIt.instance<LoginUser>();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      final user = await loginUser.call(
        username: _nameController.text,
        password: _passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Hola ${user.nickName}'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  CustomAppBar appbarWidget() {
    return CustomAppBar(
      actions: (){},
      title: languageProvider.languageSelected.LOGIN_APP_BAR,
    );
  }
  @override
  Widget bodyWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Form(
          key: _formKey,
          child: _buildColumnForm()
      ),
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
        obscureText: true,
        hintText: languageProvider.languageSelected.PASSWORD,
        icon: Icons.password,
        keyboardType: TextInputType.visiblePassword,
        controller: _passwordController,
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
                if (index < inputs.length - 1)
                  const SizedBox(height: 20),
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
            backgroundColor: Theme.of(context).primaryColorDark, // Color del texto
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Bordes redondeados
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25), // Espaciado interno del botón
            elevation: 5, // Sombra del botón
          ),
          child: Text(
            languageProvider.languageSelected.LOGIN_BUTTON,
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
