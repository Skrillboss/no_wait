import '../abstract_laguage.dart';

class JapaneseLanguage implements Language{
  @override
  String value = 'japanese';

  @override
  String SHIFT = '動く';

  /************* HINT *************/
  @override
  String NAME_HINT = '名前';
  @override
  String NICKNAME_HINT = 'ニックネーム';
  @override
  String EMAIL_HINT = 'メールアドレス';
  @override
  String PHONE_HINT = '電話番号';
  @override
  String REGISTER_BUTTON = '登録';
  @override
  String REGISTER_APP_BAR = '登録';
  @override
  String PASSWORD = 'パスワード';
  @override
  String REPEAR_PASSWORD = 'パスワードを再入力';

}