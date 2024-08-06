import 'package:flutter/material.dart';
import '../../views/views/forms/login_user_form_screen.dart';
import '../../views/views/forms/register_user_form_screen.dart';
import '../../views/views/home_screen.dart';
import '../../views/views/main_menu_screen.dart';
import '../constants/routes_constants.dart';

Map<String, Widget Function(BuildContext)> buildRoutes() {
  return {
    // Define las rutas y sus pantallas correspondientes
    RoutesConstants.mainMenu: (BuildContext context) => MainMenuView(),
    RoutesConstants.home: (BuildContext context) => const HomeScreen(),
    RoutesConstants.registerUser: (BuildContext context) => RegisterUserScreen(),
    RoutesConstants.loginUser: (BuildContext context) => LoginUserScreen(),
  };
}
