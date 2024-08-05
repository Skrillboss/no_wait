import 'package:flutter/material.dart';
import 'package:todo_turno/views/screens/forms/register_user_form_screen.dart';

// Importa las constantes de las rutas

// Importa las pantallas que vas a usar en tu aplicación

import '../../views/screens/forms/login_user_form_screen.dart';
import '../../views/screens/home_screen.dart';
import '../constants/routes_constants.dart';

Map<String, Widget Function(BuildContext)> buildRoutes() {
  return {
    // Define las rutas y sus pantallas correspondientes
    RoutesConstants.home: (BuildContext context) => const HomeScreen(),
    RoutesConstants.registerUser: (BuildContext context) => const RegisterUserScreen(),
    RoutesConstants.loginUser: (BuildContext context) => LoginUserScreen(),
  };
}
