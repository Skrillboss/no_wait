import 'package:todo_turno/features/user/domain/auth_user_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_refresh_token_repository.dart';
import '../data_providers/demo/auth_refresh_token_demo_client.dart';
import '../mappers/user_mapper.dart';

class AuthRefreshTokenRepositoryImpl implements AuthRefreshTokenRepository{
  final AuthRefreshTokenDemoClient apiClient;

  AuthRefreshTokenRepositoryImpl({required this.apiClient});

  @override
  Future<AuthUserResult> authenticateRefreshToken(String refreshToken) async {
    final Map<String, dynamic> data = await apiClient.login(refreshToken);
    final User user = UserMapper.fromJson(data['user']);
    final String token = data['token'];
    final String refreshTokenData = data['refreshToken'];
    final AuthUserResult authResult = AuthUserResult(user: user, token: token, refreshToken: refreshTokenData);
    return authResult;
  }
}