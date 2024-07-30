import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_turno/views/provider/language/language_service_provider.dart';
import '../../views/provider/bottom_navigation_bar_provider/bottom_navigation_bar_provider.dart';

class ProvidersConstants {
  static List<SingleChildWidget> ALL_PROVIDERS = [
    ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
    ChangeNotifierProvider<LanguageServiceProvider>(create: (_) => LanguageServiceProvider()),
  ];
}
