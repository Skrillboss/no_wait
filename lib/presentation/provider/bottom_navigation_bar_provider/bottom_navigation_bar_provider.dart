import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _pos = 0;
  int get getPos => _pos;

  set setPos(int pos) {
    _pos = pos;
    notifyListeners();
  }
}