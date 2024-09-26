import '../../application/dto/register_user_DTO.dart';
import '../entities/user.dart';

abstract class RegisterUserRepository {
  Future<User> register({
    required RegisterUserDTO registerUserDTO
  });
}
