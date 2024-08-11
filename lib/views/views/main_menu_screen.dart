import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/views/views/user_profile_view.dart';
import '../provider/bottom_navigation_bar_provider/bottom_navigation_bar_provider.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'forms/login_user_view.dart';
import 'forms/register_user_view.dart';
import 'shifts_view.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MainMenuScreen();
}

class _MainMenuScreen extends State<MainMenuScreen> {
  Color notActiveColor = const Color.fromRGBO(90, 90, 90, 1.0);
  Color activeColor = Colors.black;
  List<Color> menuColors = [];

  @override
  void initState() {
    menuColors = [
      activeColor,
      notActiveColor,
      notActiveColor,
      notActiveColor,
      notActiveColor,
    ];

    //initDialog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _childrens = [
      const ShiftsView(),
      LoginUserView(),
      RegisterUserView(),
      UserProfileView(),
    ];

    return Scaffold(
      body: Consumer<BottomNavigationBarProvider>(
        builder: (context, bottomNavProvider, child) {
          return IndexedStack(
              index: context.read<BottomNavigationBarProvider>().getPos,
              children: _childrens);
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 55;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 30;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w300);
  }
}
