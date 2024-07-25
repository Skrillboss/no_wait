import '../../domain/auth_result.dart';
import '../../domain/repositores/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<AuthResult> call(String username, String password) async {
    return await repository.authenticate(username, password);
  }
}
