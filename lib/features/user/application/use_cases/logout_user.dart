import '../../../../core/network/jwt_token_manager.dart';

class LogoutUser{
  final JwtTokenManager jwtTokenManager;

  LogoutUser(this.jwtTokenManager);

  Future<void> call() async {
    await jwtTokenManager.deleteToken();
    await jwtTokenManager.deleteRefreshToken();
  }
}