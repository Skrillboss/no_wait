import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../features/user/application/provider/user_provider.dart';
import '../../views/provider/bottom_navigation_bar_provider/bottom_navigation_bar_provider.dart';
import '../../views/provider/views_list_provider/views_list_provider.dart';

class ProvidersConstants {
  static List<SingleChildWidget> ALL_PROVIDERS = [
    ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => ViewsListProvider())
  ];
}
