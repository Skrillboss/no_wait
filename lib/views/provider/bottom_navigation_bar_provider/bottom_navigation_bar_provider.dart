import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _pos = 1;
  int get getPos => _pos;

  set setPos(int pos) {
    _pos = pos;
    notifyListeners();
  }
}
