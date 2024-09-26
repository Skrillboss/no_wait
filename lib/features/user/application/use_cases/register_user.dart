import '../../domain/entities/user.dart';
import '../../domain/repositories/register_user_repository.dart';
import '../dto/register_user_DTO.dart';

class RegisterUser {
  final RegisterUserRepository repository;

  RegisterUser(this.repository);

  Future<User> call({
    required RegisterUserDTO registerUserDTO
  }) async {
    return await repository.register(
      registerUserDTO: registerUserDTO
    );
  }
}
