import '../abstract_laguage.dart';

class SpanishLanguage implements Language{
  @override
  String value = 'spanish';

  @override
  String SHIFT = 'Turnos';

  /************* HINT *************/
  @override
  String NAME_HINT = 'Nombre';
  @override
  String NICKNAME_HINT = 'Apodo';
  @override
  String EMAIL_HINT = 'Correo electrónico';
  @override
  String PHONE_HINT = 'Número de teléfono';
  @override
  String REGISTER_BUTTON = 'Registrar';
  @override
  String REGISTER_APP_BAR = 'Regístrate';
  @override
  String PASSWORD = 'Contraseña';
  @override
  String REPEAR_PASSWORD = 'Repetir Contraseña';

}