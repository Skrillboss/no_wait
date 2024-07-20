import 'package:flutter/material.dart';

// Importa las constantes de las rutas

// Importa las pantallas que vas a usar en tu aplicación

import '../../views/screens/home_screen.dart';
import '../constants/routes_constants.dart';

Map<String, Widget Function(BuildContext)> buildRoutes() {
  return {
    // Define las rutas y sus pantallas correspondientes
    RoutesConstants.home: (BuildContext context) => const HomeScreen(),
  };
}
