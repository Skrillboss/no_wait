import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/views/widgets/custom_input_widget.dart';
import '../../../features/user/application/use_cases/register_user.dart';
import '../../provider/views_list_provider/views_list_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'login_user_view.dart';

class RegisterUserView extends StatelessWidget {
  final _registerFormKey = GlobalKey<FormState>();

  // Controllers para los campos de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController =
      TextEditingController();

  final RegisterUser registerUser = GetIt.instance<RegisterUser>();

  RegisterUserView({super.key});

  void changeView(BuildContext context, Widget view) {
    final ViewsListProvider viewsListProvider =
        Provider.of<ViewsListProvider>(context, listen: false);
    viewsListProvider.setProfileView = view;
  }

  Future<void> _registerUser(BuildContext context) async {
    if (_registerFormKey.currentState!.validate()) {
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
          child: Form(key: _registerFormKey, child: _buildColumnForm(context)),
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
        hintText: AppLocalizations.of(context)!.nickname,
        icon: Icons.tag_faces,
        controller: _nickNameController,
      ),
      CustomInputWidget(
        hintText: AppLocalizations.of(context)!.phone,
        icon: Icons.phone,
        keyboardType: TextInputType.phone,
        controller: _phoneNumberController,
      ),
      CustomInputWidget(
        hintText: AppLocalizations.of(context)!.email,
        icon: Icons.email,
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
      ),
      CustomInputWidget(
        obscureText: true,
        hintText: AppLocalizations.of(context)!.passwordHint,
        icon: Icons.password,
        keyboardType: TextInputType.visiblePassword,
        controller: _passwordController,
      ),
      CustomInputWidget(
        obscureText: true,
        hintText: AppLocalizations.of(context)!.repeatPasswordHint,
        icon: Icons.password,
        keyboardType: TextInputType.visiblePassword,
        controller: _passwordRepeatController,
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
              child: Text(
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
                changeView(context, LoginUserView());
              },
              child: const Text('INICIA SESION!',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            )
          ],
        )
      ],
    );
  }
}
