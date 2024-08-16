import 'package:flutter/cupertino.dart';
import '../../views/forms/login_user_view.dart';
import '../../views/settings_view.dart';
import '../../views/shifts_view.dart';

class ViewsListProvider extends ChangeNotifier {
  Widget _shiftView = const ShiftsView();
  Widget _profileView = LoginUserView();
  Widget _settingsView = const SettingsView();

  Widget get getShiftView => _shiftView;

  Widget get getProfileView => _profileView;

  Widget get getSettingsView => _settingsView;

  set setShiftView(Widget shiftView) {
    _shiftView = shiftView;
    notifyListeners();
  }

  set setProfileView(Widget profileView) {
    _profileView = profileView;
    notifyListeners();
  }

  set setSettingsView(Widget settingsView) {
    _settingsView = settingsView;
    notifyListeners();
  }
}
