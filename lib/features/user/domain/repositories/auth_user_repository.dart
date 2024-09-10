import '../auth_user_result.dart';

abstract class AuthUserRepository {
  Future<AuthUserResult> authenticate(String nickName, String password);
}