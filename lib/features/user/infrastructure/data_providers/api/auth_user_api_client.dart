import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import '../../../../../core/request_handler/request_handler.dart';
import '../repositories/auth_user_client_repository.dart';

class AuthUserApiClient extends AuthUserClientRepository{
  final RequestHandler requestHandler = RequestHandler();

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await requestHandler.postRequest(
          endPoint: '/api/login',
          dataDecode: {'nickName': username, 'password': password},
          errorCode: 2000,
          useToken: false);
      return jsonDecode(response.body);
    } on CustomException {
      rethrow;
    }
  }
}
