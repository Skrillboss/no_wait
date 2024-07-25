import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../provider/bottom_navigation_bar_provider/bottom_navigation_bar_provider.dart';

class CustomBottomNavigationBar extends StatefulWidget {

  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>{

  int _index = 0;
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
    _index = context.read<BottomNavigationBarProvider>().getPos;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return StyleProvider(
      style: Style(),
      child: ConvexAppBar(
        backgroundColor: Color.fromRGBO(235, 235, 235, 1.0),
        initialActiveIndex: _index,
        activeColor: activeColor,
        color: notActiveColor,
        style: TabStyle.fixed,
        items: [
          TabItem(
              icon: SvgPicture.asset(
                'assets/svg/wallet-icon-black.svg',
              ),
              activeIcon: SvgPicture.asset('assets/svg/wallet-icon-fill.svg'),
              title: 'prueba1'),
          TabItem(
            icon: SvgPicture.asset(
              'assets/svg/user-icon-black.svg',
            ),
            activeIcon: SvgPicture.asset('assets/svg/user-icon-fill.svg'),
            title: 'prueba2',
          ),
          TabItem(
            icon: SvgPicture.asset(
              'assets/svg/withdraw-icon-black.svg',
            ),
            activeIcon: SvgPicture.asset('assets/svg/withdraw-icon-fill.svg'),
            title: 'prueba3',
          ),
          TabItem(
            icon: SvgPicture.asset(
              'assets/svg/location-icon-black.svg',
            ),
            activeIcon: SvgPicture.asset('assets/svg/location-icon-fill.svg'),
            title: 'prueba4',
          ),
          TabItem(
            icon: SvgPicture.asset(
              'assets/svg/settings-icon-black.svg',
            ),
            activeIcon: SvgPicture.asset('assets/svg/settings-icon-fill.svg'),
            title: 'prueba5',
          ),
        ],
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
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
        fontFamily: fontFamily/*TextConstants.FONT_BODY_LIGHT*/,
        fontWeight: FontWeight.w300);
  }
}

