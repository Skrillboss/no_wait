import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import '../../../../../core/request_handler/request_handler.dart';
import '../../../application/dto/RegisterUserDTO.dart';

class RegisterUserApiClient {
  final RequestHandler requestHandler = RequestHandler();

  Future<Map<String, dynamic>> registerUser(
    RegisterUserDTO registerUserDTO,
  ) async {
    try{
      final response = await requestHandler.postRequest(
          endPoint: '/users/register',
          dataDecode: registerUserDTO.toJson(),
          errorCode: 2000,
        useToken: false
      );
      return jsonDecode(response.body);
    } on CustomException{
      rethrow;
    }
  }
}
