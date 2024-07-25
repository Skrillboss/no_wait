import '../auth_result.dart';

abstract class AuthRepository {
  Future<AuthResult> authenticate(String username, String password);
}