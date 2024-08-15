import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/bottom_navigation_bar_provider/bottom_navigation_bar_provider.dart';
import '../provider/views_list_provider/views_list_provider.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

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
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<BottomNavigationBarProvider, ViewsListProvider>(
        builder: (context, bottomNavProvider, viewsListProvider, child) {
          if (pageController.hasClients) {
            pageController.animateToPage(
              bottomNavProvider.getPos,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 250),
            );
          }
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              viewsListProvider.getProfileView,
              viewsListProvider.getShiftView,
            ],
          );
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
