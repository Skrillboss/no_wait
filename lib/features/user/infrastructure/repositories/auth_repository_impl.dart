import '../../domain/auth_user_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_user_repository.dart';
import '../data_providers/api/auth_user_api_client.dart';
import '../mappers/user_mapper.dart';

class AuthUserRepositoryImpl implements AuthUserRepository {
  final AuthUserApiClient apiClient;

  AuthUserRepositoryImpl({required this.apiClient});

  @override
  Future<AuthUserResult> authenticate(String nickName, String password) async {
    final Map<String, dynamic> data = await apiClient.login(nickName, password);
    final User user = UserMapper.fromJson(data['userDTO']);
    final String token = data['token'];
    final String refreshToken = data['refreshToken'];
    final AuthUserResult authResult = AuthUserResult(user: user, token: token, refreshToken: refreshToken);
    return authResult;
  }
}
