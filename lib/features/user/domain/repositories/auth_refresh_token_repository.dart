import '../auth_user_result.dart';

abstract class AuthRefreshTokenRepository {
  Future<AuthUserResult> authenticateRefreshToken(String refreshToken);
}