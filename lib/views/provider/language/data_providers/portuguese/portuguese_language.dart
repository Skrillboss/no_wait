import '../abstract_laguage.dart';

class PortugueseLanguage implements Language{
  @override
  String value = 'portuguese';

  @override
  String SHIFT = 'Turno';

  /************* HINT *************/
  @override
  String NAME_HINT = 'Nome';
  @override
  String NICKNAME_HINT = 'Apelido';
  @override
  String EMAIL_HINT = 'Email';
  @override
  String PHONE_HINT = 'Telefone';
  @override
  String REGISTER_BUTTON = 'Registrar';
  @override
  String REGISTER_APP_BAR = 'Registrar';
  @override
  String PASSWORD = 'Senha';
  @override
  String REPEAR_PASSWORD = 'Repetir Senha';

}