import '../../../application/dto/RegisterUserDTO.dart';

abstract class RegisterUserClientRepository {
  Future<Map<String, dynamic>> registerUser(
    RegisterUserDTO registerUserDTO,
  );
}
