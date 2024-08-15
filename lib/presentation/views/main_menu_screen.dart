import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import '../provider/bottom_navigation_bar_provider/bottom_navigation_bar_provider.dart';
import 'package:animations/animations.dart';
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
  List<Color> menuColors = [];
  int previousPosition = 0;

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
    return Scaffold(
      body: Consumer2<BottomNavigationBarProvider, ViewsListProvider>(
        builder: (context, bottomNavProvider, viewsListProvider, child) {
          return PageTransitionSwitcher(
            duration: const Duration(milliseconds: 2000),
            transitionBuilder: (Widget child,
                Animation<double> primaryAnimation,
                Animation<double> secondaryAnimation) {
              Tuple4<Offset, Offset, Offset, Offset> animationBeginAndEnd =
                  getAnimation(bottomNavProvider.getPos);
              return SlideTransition(
                position: Tween<Offset>(
                  begin: animationBeginAndEnd.item1,
                  end: animationBeginAndEnd.item2,
                ).animate(primaryAnimation),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: animationBeginAndEnd.item3,
                    end: animationBeginAndEnd.item4,
                  ).animate(secondaryAnimation),
                  child: child, // Aquí se añadió el child que faltaba
                ),
              );
            },
            child: IndexedStack(
              key: ValueKey<int>(bottomNavProvider.getPos),
              index: bottomNavProvider.getPos,
              children: [
                viewsListProvider.getProfileView,
                viewsListProvider.getShiftView,
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Tuple4<Offset, Offset, Offset, Offset> getAnimation(int currentPosition) {
    Tuple4<Offset, Offset, Offset, Offset> animationsBeginAndEnd =
        const Tuple4<Offset, Offset, Offset, Offset>(
            Offset.zero, Offset(1.0, 0.0), Offset(-1.0, 0.0), Offset.zero);

    if (previousPosition < currentPosition) {
      animationsBeginAndEnd = const Tuple4<Offset, Offset, Offset, Offset>(
          Offset.zero, Offset(-1.0, 0.0), Offset(1.0, 0.0), Offset.zero);
    }
    previousPosition = currentPosition;
    return animationsBeginAndEnd;
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
