import '../abstract_laguage.dart';

class CatalanLanguage implements Language{
  @override
  String value = 'catalan';

  @override
  String SHIFT = 'Moure';

  @override
  String NAME_HINT = 'Nom';
  @override
  String NICKNAME_HINT = 'Àlies';
  @override
  String EMAIL_HINT = 'Correu electrònic';
  @override
  String PHONE_HINT = 'Telèfon';
  @override
  String REGISTER_BUTTON = 'Registrar';
  @override
  String REGISTER_APP_BAR = 'Regístrate';
  @override
  String PASSWORD = 'Contrasenya';
  @override
  String REPEAR_PASSWORD = 'Repeteix contrasenya';

}