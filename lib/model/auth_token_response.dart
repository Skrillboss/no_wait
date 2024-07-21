class AuthTokenResponse {
  final String token;
  final DateTime createAt;
  final DateTime expiration;

  AuthTokenResponse(
      {required this.createAt, required this.expiration, required this.token});
}
