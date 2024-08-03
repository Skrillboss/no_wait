import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'config/constants/providers_constants.dart';
import 'config/constants/routes_constants.dart';
import 'config/router/build_routes.dart';
import 'core/server_locator/server_locator.dart';

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
  setupServiceLocator();
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
        primarySwatch: Colors.green,
      ),
      initialRoute: RoutesConstants.loginUser,
      routes: buildRoutes(),
    );
  }
}