import 'dart:convert';
import '../../../../../core/request_handler/request_handler.dart';
import '../repositories/auth_user_client_repository.dart';

class AuthUserApiClient extends AuthUserClientRepository {
  final RequestHandler requestHandler = RequestHandler();

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
      final response = await requestHandler.postRequest(
        endPoint: '/user/login',
        dataDecode: {'nickName': username, 'password': password},
        errorCode: 2000,
        useToken: false,
        isFormData: true,
      );
      return jsonDecode(response.body);
  }
}
