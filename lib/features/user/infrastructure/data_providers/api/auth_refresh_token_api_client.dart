import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import '../../../../../core/request_handler/request_handler.dart';

class AuthRefreshTokenApiClient {
  final RequestHandler requestHandler = RequestHandler();

  Future<Map<String, dynamic>> login(String refreshToken) async {
    try{
      final response = await requestHandler.postRequest(
          endPoint: '/login/refreshToken',
          dataDecode: {'refreshToken': refreshToken},
          errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException{
      rethrow;
    }
  }
}
