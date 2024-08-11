import '../../../../core/network/jwt_token_manager.dart';
import '../../domain/auth_user_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_refresh_token_repository.dart';

class LoginUserToken{
  final AuthRefreshTokenRepository repository;
  final JwtTokenManager jwtTokenManager;

  LoginUserToken(this.repository, this.jwtTokenManager);

  Future<User> call({required String refreshToken}) async {
    AuthUserResult authUserResult = await repository.authenticateRefreshToken(refreshToken);
    await jwtTokenManager.saveToken(authUserResult.token);
    await jwtTokenManager.saveRefreshToken(authUserResult.refreshToken);
    return authUserResult.user;
  }
}