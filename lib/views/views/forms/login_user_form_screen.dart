import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_turno/features/user/application/use_cases/login_user.dart';
import 'package:todo_turno/views/widgets/custom_input_widget.dart';
import '../../widgets/custom_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginUserScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  // Controllers para los campos de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginUser loginUser = GetIt.instance<LoginUser>();

  LoginUserScreen({super.key});

  Future<void> _loginUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final user = await loginUser.call(
        username: _nameController.text,
        password: _passwordController.text,
      );

      //TODO: Cuando tengamos una pantalla correspondiente para el exito o no del login, se debe quitar el shiwSnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Hola ${user.nickName}'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: () {},
        title: AppLocalizations.of(context)!.loginAppBar,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Form(key: _formKey, child: _buildColumnForm(context)),
      ),
    );
  }

  Widget _buildColumnForm(BuildContext context) {
    List<Widget> inputs = [
      CustomInputWidget(
        hintText: AppLocalizations.of(context)!.nameHint,
        icon: Icons.person,
        controller: _nameController,
      ),
      CustomInputWidget(
        obscureText: true,
        hintText: AppLocalizations.of(context)!.passwordHint,
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
                if (index < inputs.length - 1) const SizedBox(height: 20),
              ],
            );
          },
        ),
        const SizedBox(height: 20), // Espacio antes del botón
        ElevatedButton(
          onPressed: () => _loginUser(context),
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(500),
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
            AppLocalizations.of(context)!.loginButton,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
