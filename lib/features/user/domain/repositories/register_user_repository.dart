import '../../application/dto/RegisterUserDTO.dart';
import '../entities/user.dart';

abstract class RegisterUserRepository {
  Future<User> register({
    required RegisterUserDTO registerUserDTO
  });
}
