import 'package:flutter/cupertino.dart';
import '../../views/add/qr_select_function_view.dart';
import '../../views/auth/login_user_view.dart';
import '../../views/settings_view.dart';
import '../../views/shifts_view.dart';
import '../../views/map_view.dart';

class ViewsListProvider extends ChangeNotifier {
  Widget _shiftView = const ShiftsView();
  Widget _profileView = const LoginUserView();
  Widget _settingsView = const SettingsView();
  Widget _qrScannerView = const QrSelectFunctionView();
  Widget _mapView = const MapView();

  Widget get getShiftView => _shiftView;

  Widget get getProfileView => _profileView;

  Widget get getQrScannerView => _qrScannerView;

  Widget get getMapView => _mapView;

  Widget get getSettingsView => _settingsView;

  set setShiftView(Widget shiftView) {
    _shiftView = shiftView;
    notifyListeners();
  }

  set setProfileView(Widget profileView) {
    _profileView = profileView;
    notifyListeners();
  }

  set setQrScannerView(Widget qrScannerView) {
    _qrScannerView = qrScannerView;
    notifyListeners();
  }

  set setMapView(Widget mapView){
    _mapView = mapView;
    notifyListeners();
  }

  set setSettingsView(Widget settingsView) {
    _settingsView = settingsView;
    notifyListeners();
  }
}
