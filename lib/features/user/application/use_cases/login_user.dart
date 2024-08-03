import '../../domain/auth_user_result.dart';
import '../../domain/repositories/auth_user_repository.dart';

class LoginUser {
  final AuthUserRepository repository;

  LoginUser(this.repository);

  Future<AuthUserResult> call(String username, String password) async {
    return await repository.authenticate(username, password);
  }
}
