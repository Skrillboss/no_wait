import 'package:flutter/widgets.dart';
import 'package:todo_turno/features/user/domain/entities/user.dart';

class UserProvider extends ChangeNotifier{
  User? _user;
  User? get getUser => _user;

  set setUser(User user){
    _user = user;
    notifyListeners();
  }
}