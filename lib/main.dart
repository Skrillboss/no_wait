import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart'; // Importa esto cuando vayas a usar Provider
import 'config/constants/providers_constants.dart';
import 'config/constants/routes_constants.dart';
import 'config/router/build_routes.dart'; // Asegúrate de que esta ruta sea correcta

Future<void> main() async {
  // Asegúrate de que Flutter esté inicializado
  WidgetsFlutterBinding.ensureInitialized();

  // Configura cualquier servicio o librería que necesites antes de iniciar la app
  await configureServices();
  await dotenv.load(fileName: '.env');

  // Corre la aplicación
  runApp(MultiProvider(
    providers: ProvidersConstants.ALL_PROVIDERS,
    child: const MyApp(),
  ));

}

Future<void> configureServices() async {
  // Aquí puedes inicializar cualquier servicio que necesites antes de correr la app
  // Ejemplo: Inicializar una base de datos, servicios de logging, etc.
  // await DatabaseService.init();
  // await LoggingService.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesConstants.home,
      routes: buildRoutes(),
    );
  }
}

// Para el futuro, cuando necesites integrar Provider, descomenta la siguiente sección
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Aquí defines los proveedores que vas a usar en tu aplicación
        // Ejemplo: ChangeNotifierProvider(create: (_) => YourProvider()),
      ],
      child: _buildMaterialApp(),
    );
  }

  MaterialApp _buildMaterialApp() {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesConstants.home,
      routes: buildRoutes(),
    );
  }
}
*/
