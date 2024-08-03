import '../abstract_laguage.dart';

class FrenchLanguage implements Language{
  @override
  String value = 'french';

  @override
  String SHIFT = 'Tour';

  /************* HINT *************/
  @override
  String NAME_HINT = 'Name';
  @override
  String NICKNAME_HINT = 'Nickname';
  @override
  String EMAIL_HINT = 'Email';
  @override
  String PHONE_HINT = 'Phone';
  @override
  String REGISTER_BUTTON = 'Register';
  @override
  String REGISTER_APP_BAR = 'Inscription';
  @override
  String PASSWORD = 'Mot de passe';
  @override
  String REPEAR_PASSWORD = 'Répéter le mot de passe';
  @override
  String LOGIN_BUTTON = 'Se connecter';  // Iniciar sesión
  @override
  String LOGIN_APP_BAR = 'Se connecter';  // Inicia sesión

}