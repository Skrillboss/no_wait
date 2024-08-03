import '../abstract_laguage.dart';

class RussianLanguage implements Language{
  @override
  String value = 'russian';

  @override
  String SHIFT = 'Очередь';

  /************* HINT *************/
  @override
  String NAME_HINT = 'Имя';
  @override
  String NICKNAME_HINT = 'Псевдоним';
  @override
  String EMAIL_HINT = 'Электронная почта';
  @override
  String PHONE_HINT = 'Телефон';
  @override
  String REGISTER_BUTTON = 'Зарегистрироваться';
  @override
  String REGISTER_APP_BAR = 'Регистрация';
  @override
  String PASSWORD = 'Пароль';
  @override
  String REPEAR_PASSWORD = 'Повторите пароль';
  @override
  String LOGIN_BUTTON = 'Войти';  // Войти
  @override
  String LOGIN_APP_BAR = 'Войти';  // Войти

}