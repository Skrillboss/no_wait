import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import '../../../../../core/request_handler/request_handler.dart';
import '../repositories/auth_refresh_token_client_repository.dart';

class AuthRefreshTokenApiClient extends AuthRefreshTokenClientRepository{
  final RequestHandler requestHandler = RequestHandler();

  @override
  Future<Map<String, dynamic>> login(String accessToken) async {
    try{
      final response = await requestHandler.postRequest(
          endPoint: '/user/refreshToken',
          dataDecode: {'accessToken': accessToken},
          errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException{
      rethrow;
    }
  }
}
