import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import 'package:todo_turno/core/request_handler_service/request_handler.dart';

class AuthUserApiClient {
  final RequestHandler requestHandler = RequestHandler();

  Future<Map<String, dynamic>> login(String username, String password) async {
    try{
      final response = await requestHandler.postRequest(
          endPoint: '/login',
          dataDecode: {'username': username, 'password': password},
          errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException{
      rethrow;
    }
  }
}
