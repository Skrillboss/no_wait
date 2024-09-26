import 'package:todo_turno/features/user/domain/entities/user.dart';
import '../../application/dto/register_user_DTO.dart';
import '../../domain/repositories/register_user_repository.dart';
import '../data_providers/repositories/register_user_client_repository.dart';
import '../mappers/user_mapper.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  final RegisterUserClientRepository apiClient;

  RegisterUserRepositoryImpl({required this.apiClient});

  @override
  Future<User> register({required RegisterUserDTO registerUserDTO}) async {
    final Map<String, dynamic> data =
        await apiClient.registerUser(registerUserDTO);
    final User user = UserMapper.fromJson(data);
    return user;
  }
}
