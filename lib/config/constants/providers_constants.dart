import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../views/provider/bottom_navigation_bar_provider/bottom_navigation_bar_provider.dart';

class ProvidersConstants {
  static List<SingleChildWidget> ALL_PROVIDERS = [
    ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
  ];
}
