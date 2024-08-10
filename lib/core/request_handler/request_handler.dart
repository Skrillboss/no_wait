import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import 'package:todo_turno/core/network/jwt_token_manager.dart';

class RequestHandler {
  static final RequestHandler _requestHandlerInstance =
      RequestHandler._internal();

  factory RequestHandler() {
    return _requestHandlerInstance;
  }

  RequestHandler._internal();

  final http.Client httpClient = GetIt.instance<http.Client>();
  final String baseApiUrl = 'https://example.app';
  final JwtTokenManager _tokenManager = JwtTokenManager();

  /// ***************************************************************************
  ///                               USE REFRESH TOKEN                          *
  ///***************************************************************************

  Future<void> _refreshTokenRequest() async {
    try {
      final String? refreshToken = await _tokenManager.getRefreshToken();
      Response response = await postRequest(
        endPoint: '/refresh',
        dataDecode: {'refreshToken': refreshToken},
        errorCode: 2000,
      );
      if (response.statusCode == 401) {
        throw CustomException(
            2000, 'Refresh token expired, please log in again.');
      }

      final String jwtToken = jsonDecode(response.body)['JwtToken'];
      _tokenManager.saveToken(jwtToken);
    } on CustomException {
      rethrow;
    } catch (e) {
      throw CustomException(2000, 'Error when trying to refresh the JWT token');
    }
  }

  /// ***************************************************************************
  ///                            REQUEST HANDLER                               *
  ///***************************************************************************

  Future<Response> _sendRequestOrRefreshToken(
      Future<Response> Function() requestFunction) async {
    try {
      final response = await requestFunction();
      if (response.statusCode == 401) {
        await _refreshTokenRequest();
        return await requestFunction();
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// ***************************************************************************
  ///                                      GET                                 *
  ///***************************************************************************

  Future<Response> getRequest({
    required String endPoint,
    required int errorCode,
  }) async {
    try {
      final String? token = await _tokenManager.getToken();
      return _sendRequestOrRefreshToken(() async {
        return await httpClient.get(
          Uri.parse('$baseApiUrl$endPoint'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
      });
    } on CustomException {
      rethrow;
    } catch (e) {
      throw CustomException(errorCode, e.toString());
    }
  }

  /// ***************************************************************************
  ///                                      POST                                *
  ///***************************************************************************

  Future<Response> postRequest({
    required String endPoint,
    required Object? dataDecode,
    required int errorCode,
  }) async {
    try {
      final String? token = await _tokenManager.getToken();
      return _sendRequestOrRefreshToken(() async {
        return await httpClient.post(
          Uri.parse('$baseApiUrl$endPoint'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(dataDecode),
        );
      });
    } on CustomException {
      rethrow;
    } catch (e) {
      throw CustomException(errorCode, e.toString());
    }
  }

  /// ***************************************************************************
  ///                                      POST                                *
  ///***************************************************************************

  Future<Response> deleteRequest(
      {required String endPoint,
      required Object? dataDecode,
      required int errorCode}) async {
    try {
      final String? token = await _tokenManager.getToken();
      return _sendRequestOrRefreshToken(() async {
        return await httpClient.delete(
          Uri.parse('$baseApiUrl$endPoint'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(dataDecode),
        );
      });
    } on CustomException {
      rethrow;
    } catch (e) {
      throw CustomException(errorCode, e.toString());
    }
  }
}
