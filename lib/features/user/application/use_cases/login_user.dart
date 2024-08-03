import 'package:todo_turno/features/user/domain/entities/user.dart';

import '../../../../core/network/jwt_token_manager.dart';
import '../../domain/auth_user_result.dart';
import '../../domain/repositories/auth_user_repository.dart';

class LoginUser {
  final AuthUserRepository repository;
  final JwtTokenManager jwtTokenManager;

  LoginUser(this.repository, this.jwtTokenManager);

  Future<User> call({required String username, required String password}) async {
    AuthUserResult authUserResult = await repository.authenticate(username, password);
    await jwtTokenManager.saveToken(authUserResult.token);
    return authUserResult.user;
  }
}
