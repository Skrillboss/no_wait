import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bottom_navigation_bar_provider/bottom_navigation_bar_provider.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'forms/login_user_form_screen.dart';
import 'home_screen.dart';

class MainMenuView extends StatefulWidget {
  final bool show;
  // final int pos;

  MainMenuView({
    Key? key,
    this.show = true,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MainMenuView();
  }
}

class _MainMenuView extends State<MainMenuView> {
  int _index = 0;
  Color notActiveColor = Color.fromRGBO(90, 90, 90, 1.0);
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
    _index = context.read<BottomNavigationBarProvider>().getPos;
    super.initState();
  }

  final List<Widget> _childrens = [
    const HomeScreen(),
    LoginUserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _childrens),
      bottomNavigationBar: const CustomBottomNavigationBar()
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
    return TextStyle(
        fontSize: 10,
        color: color,
        fontWeight: FontWeight.w300);
  }
}
