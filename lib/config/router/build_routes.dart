import 'package:flutter/material.dart';
import '../../presentation/screens/welcome_splash_screen.dart';
import '../constants/routes_constants.dart';

Map<String, Widget Function(BuildContext)> buildRoutes() {
  return {
    RoutesConstants.welcomeSplash: (BuildContext context) => const WelcomeSplashScreen(),
  };
}
