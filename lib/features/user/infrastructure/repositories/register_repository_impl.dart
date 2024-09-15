import 'package:todo_turno/features/user/domain/entities/user.dart';
import '../../application/dto/RegisterUserDTO.dart';
import '../../domain/repositories/register_user_repository.dart';
import '../data_providers/demo/register_user_demo_client.dart';
import '../mappers/user_mapper.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  final RegisterUserDemoClient apiClient;

  RegisterUserRepositoryImpl({required this.apiClient});

  @override
  Future<User> register({required RegisterUserDTO registerUserDTO}) async {
    final Map<String, dynamic> data =
        await apiClient.registerUser(registerUserDTO);
    final User user = UserMapper.fromJson(data['userDTO']);
    return user;
  }
}
