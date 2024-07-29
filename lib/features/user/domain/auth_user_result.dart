import 'entities/user.dart';

class AuthUserResult {
  final User user;
  final String token;

  AuthUserResult({
    required this.user,
    required this.token,
  });
}
