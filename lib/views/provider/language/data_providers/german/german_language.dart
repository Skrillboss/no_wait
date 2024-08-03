import '../abstract_laguage.dart';

class GermanLanguage implements Language{
  @override
  String value = 'german';

  @override
  String SHIFT = 'Umschalten';

  /************* HINT *************/
  @override
  String NAME_HINT = 'Nom';
  @override
  String NICKNAME_HINT = 'Surnom';
  @override
  String EMAIL_HINT = 'Email';
  @override
  String PHONE_HINT = 'Téléphone';
  @override
  String REGISTER_BUTTON = 'S\'inscrire';
  @override
  String REGISTER_APP_BAR = 'Registrieren';
  @override
  String PASSWORD = 'Passwort';
  @override
  String REPEAR_PASSWORD = 'Passwort wiederholen';

}