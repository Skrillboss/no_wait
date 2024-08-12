import 'package:flutter/cupertino.dart';
import 'package:todo_turno/views/views/forms/login_user_view.dart';
import 'package:todo_turno/views/views/shifts_view.dart';

class ViewsListProvider extends ChangeNotifier{

  Widget _shiftView = const ShiftsView();
  Widget _profileView = LoginUserView();

  Widget get getShiftView => _shiftView;
  Widget get getProfileView => _profileView;

  set setShiftView(Widget shiftView){
    _shiftView = shiftView;
    notifyListeners();
  }

  set setProfileView(Widget profileView){
    _profileView = profileView;
    notifyListeners();
  }
}
