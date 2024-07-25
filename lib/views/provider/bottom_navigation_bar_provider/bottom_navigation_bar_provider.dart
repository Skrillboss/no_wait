import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _pos = 0;
  get getPos => this._pos;

  set setPos(int pos) {
    this._pos = pos;
    notifyListeners();
  }
}
