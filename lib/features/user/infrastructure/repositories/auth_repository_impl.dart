import '../../domain/auth_user_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_user_repository.dart';
import '../data_providers/demo/auth_user_demo_client.dart';
import '../mappers/user_mapper.dart';

class AuthUserRepositoryImpl implements AuthUserRepository {
  final AuthUserDemoClient apiClient;

  AuthUserRepositoryImpl({required this.apiClient});

  @override
  Future<AuthUserResult> authenticate(String username, String password) async {
    final Map<String, dynamic> data = await apiClient.login(username, password);
    final User user = UserMapper.fromJson(data['user']);
    final String token = data['token'];
    AuthUserResult authResult = AuthUserResult(user: user, token: token);
    return authResult;
  }
}
