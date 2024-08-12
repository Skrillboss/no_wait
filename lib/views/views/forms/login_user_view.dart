import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/features/user/application/use_cases/login_user.dart';
import 'package:todo_turno/views/provider/views_list_provider/views_list_provider.dart';
import 'package:todo_turno/views/views/forms/register_user_view.dart';
import 'package:todo_turno/views/views/user_profile_view.dart';
import 'package:todo_turno/views/widgets/custom_input_widget.dart';
import '../../../features/user/application/provider/user_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginUserView extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();

  // Controllers para los campos de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginUser loginUser = GetIt.instance<LoginUser>();

  LoginUserView({super.key});

  void changeView(BuildContext context, Widget view) {
    final ViewsListProvider viewsListProvider =
        Provider.of<ViewsListProvider>(context, listen: false);
    viewsListProvider.setProfileView = view;
  }

  Future<void> _loginUser(BuildContext context) async {
    if (_loginFormKey.currentState!.validate()) {
      final UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser = await loginUser.call(
        username: _nameController.text,
        password: _passwordController.text,
      );
      if (userProvider.getIsLogged) {
        changeView(context, UserProfileView());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Form(key: _loginFormKey, child: _buildColumnForm(context)),
        ),
      ),
    );
  }

  Widget _buildColumnForm(BuildContext context) {
    List<Widget> inputs = [
      CustomInputWidget(
        hintText: AppLocalizations.of(context)!.name,
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'AQUI DEBE HABER UNA IMAGEN\nBONITA DE UN SAPITO QUE\nREACCIONE AL TAP DEL USUARIO\nde Luis para Luis\n:)',
          textAlign: TextAlign.center,
        ),
        Column(
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
                fixedSize: const Size.fromWidth(500),
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColorDark,
                // Color del texto
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bordes redondeados
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
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
            ),
            const SizedBox(height: 10),
            const Text(
              'Aun no tienes una cuenta?',
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                changeView(context, RegisterUserView());
              },
              child: const Text('Registrate!',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            )
          ],
        ),
      ],
    );
  }
}
