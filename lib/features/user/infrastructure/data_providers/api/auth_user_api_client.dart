import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import '../../../../../core/request_handler/request_handler.dart';

class AuthUserApiClient {
  final RequestHandler requestHandler = RequestHandler();

  Future<Map<String, dynamic>> login(String username, String password) async {
    try{
      final response = await requestHandler.postRequest(
          endPoint: '/users/login',
          dataDecode: {'nickName': username, 'password': password},
          errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException{
      rethrow;
    }
  }
}
