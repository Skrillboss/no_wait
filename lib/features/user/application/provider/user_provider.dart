import 'package:flutter/widgets.dart';
import 'package:todo_turno/features/user/domain/entities/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  bool _isLogged = false;

  User? get getUser => _user;
  bool get getIsLogged => _isLogged;

  String? getBusinessId(){
    return _user?.business?.id;
  }

  void logOut() {
    _user = null;
    _isLogged = false;
    notifyListeners();
  }

  set setUser(User user) {
    _user = user;
    _isLogged = true;
    notifyListeners();
  }
}
