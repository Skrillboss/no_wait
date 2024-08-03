import '../abstract_laguage.dart';

class ChineseLanguage implements Language{
  @override
  String value = 'chinese';

  @override
  String SHIFT = '转';

  /************* HINT *************/
  @override
  String NAME_HINT = '姓名';
  @override
  String NICKNAME_HINT = '昵称';
  @override
  String EMAIL_HINT = '电子邮件';
  @override
  String PHONE_HINT = '电话';
  @override
  String REGISTER_BUTTON = '注册';
  @override
  String REGISTER_APP_BAR = '注册';
  @override
  String PASSWORD = '密码';
  @override
  String REPEAR_PASSWORD = '重复密码';
  @override
  String LOGIN_BUTTON = '登录';  // 登录
  @override
  String LOGIN_APP_BAR = '登录';  // 登录

}