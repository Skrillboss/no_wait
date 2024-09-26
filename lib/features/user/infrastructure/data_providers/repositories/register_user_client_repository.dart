import '../../../application/dto/register_user_DTO.dart';

abstract class RegisterUserClientRepository {
  Future<Map<String, dynamic>> registerUser(
    RegisterUserDTO registerUserDTO,
  );
}
