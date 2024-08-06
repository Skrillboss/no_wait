import 'package:flutter/material.dart';
import '../../views/views/forms/login_user_view.dart';
import '../../views/views/forms/register_user_view.dart';
import '../../views/views/shifts_view.dart';
import '../../views/views/main_menu_screen.dart';
import '../constants/routes_constants.dart';

Map<String, Widget Function(BuildContext)> buildRoutes() {
  return {
    // Define las rutas y sus pantallas correspondientes
    RoutesConstants.mainMenu: (BuildContext context) => MainMenuView(),
    RoutesConstants.home: (BuildContext context) => const ShiftsView(),
    RoutesConstants.registerUser: (BuildContext context) => RegisterUserView(),
    RoutesConstants.loginUser: (BuildContext context) => LoginUserView(),
  };
}
