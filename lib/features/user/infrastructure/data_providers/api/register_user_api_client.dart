import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import '../../../../../core/request_handler/request_handler.dart';
import '../../../application/dto/register_user_DTO.dart';
import '../repositories/register_user_client_repository.dart';

class RegisterUserApiClient extends RegisterUserClientRepository {
  final RequestHandler requestHandler = RequestHandler();

  @override
  Future<Map<String, dynamic>> registerUser(
    RegisterUserDTO registerUserDTO,
  ) async {
    try {
      final response = await requestHandler.postRequest(
          endPoint: '/user/register',
          dataDecode: registerUserDTO.toJson(),
          errorCode: 2000,
          useToken: false);
      return jsonDecode(response.body);
    } on CustomException {
      rethrow;
    }
  }
}
