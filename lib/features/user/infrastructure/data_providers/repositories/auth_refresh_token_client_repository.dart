abstract class AuthRefreshTokenClientRepository {
  Future<Map<String, dynamic>> login(String refreshToken);
}