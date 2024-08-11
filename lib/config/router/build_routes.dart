import 'package:flutter/material.dart';
import '../../views/views/forms/login_user_view.dart';
import '../../views/views/forms/register_user_view.dart';
import '../../views/views/screens/welcome_splash_screen.dart';
import '../../views/views/shifts_view.dart';
import '../../views/views/main_menu_screen.dart';
import '../constants/routes_constants.dart';

Map<String, Widget Function(BuildContext)> buildRoutes() {
  return {
    RoutesConstants.welcomeSplash: (BuildContext context) => const WelcomeSplashScreen(),
    RoutesConstants.mainMenu: (BuildContext context) => const MainMenuView(),
    RoutesConstants.home: (BuildContext context) => const ShiftsView(),
    RoutesConstants.registerUser: (BuildContext context) => RegisterUserView(),
    RoutesConstants.loginUser: (BuildContext context) => LoginUserView(),
  };
}
