import 'entities/user.dart';

class AuthUserResult {
  final User user;
  final String token;
  final String refreshToken;

  AuthUserResult({
    required this.user,
    required this.token,
    required this.refreshToken
  });
}
