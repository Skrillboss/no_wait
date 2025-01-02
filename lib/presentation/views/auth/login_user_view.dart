import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import 'package:todo_turno/features/user/application/use_cases/login_user.dart';
import 'package:todo_turno/presentation/views/auth/register_user_view.dart';
import '../../../features/user/application/provider/user_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider/views_list_provider/views_list_provider.dart';
import '../../widgets/custom_input_widget.dart';
import '../user_profile_view.dart';

class LoginUserView extends StatefulWidget {
  const LoginUserView({super.key});

  @override
  _LoginUserViewState createState() => _LoginUserViewState();
}

class _LoginUserViewState extends State<LoginUserView> {
  final _loginFormKey = GlobalKey<FormState>();

  // Controllers para los campos de texto
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginUser loginUser = GetIt.instance<LoginUser>();
  bool isLoading = false;
  String errorMessage = '';

  void changeView(BuildContext context, Widget view) {
    final ViewsListProvider viewsListProvider =
        Provider.of<ViewsListProvider>(context, listen: false);
    viewsListProvider.setProfileView = view;
  }

  Future<void> _loginUser(BuildContext context) async {
    if (_loginFormKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      try{
        userProvider.setUser = await loginUser.call(
          nickName: _nickNameController.text,
          password: _passwordController.text,
        );
        if (userProvider.getIsLogged) {
          changeView(context, UserProfileView());
        }
      }on CustomException catch(e){
        for (var appError in e.errorCodes) {
          switch(appError){
            case 2007:
              errorMessage = 'El usuario con el apodo: ${_nickNameController.text} no existe';
              //TODO: meter este texto dentro de una constante que se controle por el idioma
            case 3002:
              errorMessage = 'Usuario o contraseña incorrecta';
            default:
              errorMessage = 'A ocurrido un error, intentelo mas tarde';
          }
        }
      }finally{
        if(mounted){
          setState(() {
            isLoading = false;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _nickNameController.dispose();
    _passwordController.dispose();
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
                end: Alignment.bottomLeft),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Form(key: _loginFormKey, child: _buildColumnForm(context)),
          ),
        ),
      ),
    );
  }

  Widget _buildColumnForm(BuildContext context) {
    List<Widget> inputs = [
      CustomInputWidget(
        hintText: AppLocalizations.of(context)!.nickname,
        icon: const Icon(Icons.person),
        textController: _nickNameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'El campo no puede estas vacio';
          } else if (value.length < 5) {
            return 'El campo debe tener como minimo 5 caracteres';
          }
          return null;
        },
      ),
      CustomInputWidget(
        obscureText: true,
        hintText: AppLocalizations.of(context)!.passwordHint,
        icon: const Icon(Icons.password),
        keyboardType: TextInputType.visiblePassword,
        textController: _passwordController,
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
            Text(errorMessage),

            ElevatedButton(
              onPressed: () => _loginUser(context),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(500),
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColorDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bordes redondeados
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                elevation: 5, // Sombra del botón
              ),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Text(
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
                changeView(context, const RegisterUserView());
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
