import '../../../../core/network/jwt_token_manager.dart';
import '../../domain/auth_user_result.dart';
import '../../domain/entities/user.dart';
import '../use_cases/login_user.dart';

class AuthViewModel {
  final LoginUser loginUser;
  final JwtTokenManager jwtTokenManager;

  AuthViewModel({required this.loginUser, required this.jwtTokenManager});

  Future<User> authenticate(String username, String password) async {
    final AuthUserResult authResult = await loginUser.call(username, password);
        await jwtTokenManager.saveToken(authResult.token);
        return authResult.user;
  }
}