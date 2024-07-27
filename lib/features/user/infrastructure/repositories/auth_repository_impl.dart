import '../../domain/auth_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_providers/auth_demo_client.dart';
import '../mappers/user_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDemoClient apiClient;

  AuthRepositoryImpl({required this.apiClient});

  @override
  Future<AuthResult> authenticate(String username, String password) async {
    final Map<String, dynamic> data = await apiClient.login(username, password);
    final User user = UserMapper.fromJson(data['user']);
    final String token = data['token'];
    AuthResult authResult = AuthResult(user: user, token: token);
    return authResult;
  }
}
