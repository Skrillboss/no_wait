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
  final String baseNoWaitUrl = 'https://9f29-85-61-254-238.ngrok-free.app';
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
      if (response.statusCode == 701) {
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

  Future<Response> _requestHandler(
      Future<Response> Function() requestFunction) async {
      Response response = await requestFunction();
      if(!(response.statusCode >= 200 && response.statusCode < 300)) {
        switch (response.statusCode) {
          case 401:
            throw Exception('Unauthorized User, code: ${response.statusCode}');
          case 700:
            await _refreshTokenRequest();
            response = await requestFunction();
          default:
            throw Exception('Unhandled error, code: ${response.statusCode}');
        }
      }
      return response;
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
      return await _requestHandler(() async {
        return await httpClient.get(
          Uri.parse('$baseNoWaitUrl$endPoint'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
      });
    } on Exception catch (e) {
      throw CustomException(errorCode, e.toString());
    } catch (e) {
      throw CustomException(errorCode, e.toString());
    }
  }

  /// ***************************************************************************
  ///                                      POST                                *
  ///***************************************************************************

  Future<Response> postRequest({
    String? baseApiUrl,
    required String endPoint,
    required Object? dataDecode,
    required int errorCode,
    bool isFormData = false, // Nuevo parámetro para controlar si es form-data
    bool useToken = true,
  }) async {
    try {
      return await _requestHandler(() async {
        final String? token = await _tokenManager.getToken();
        final String baseUrl = baseApiUrl ?? baseNoWaitUrl;

        if (isFormData && dataDecode is Map<String, String>) {
          // if form-data
          var request = http.MultipartRequest('POST', Uri.parse('$baseUrl$endPoint'));

          request.headers.addAll({
            if (useToken && token != null) 'Authorization': 'Bearer $token',
          });

          request.fields.addAll(dataDecode);

          var streamedResponse = await request.send();
          return await http.Response.fromStream(streamedResponse);
        } else {
          // if JSON
          return await httpClient.post(
            Uri.parse('$baseUrl$endPoint'),
            headers: {
              'Content-Type': 'application/json',
              if (useToken && token != null) 'Authorization': 'Bearer $token',
            },
            body: jsonEncode(dataDecode),
          );
        }
      });
    } on Exception catch (e) {
      throw CustomException(errorCode, e.toString());
    } catch (e) {
      throw CustomException(errorCode, e.toString());
    }
  }


  /// ***************************************************************************
  ///                                      DELETE                              *
  ///***************************************************************************

  Future<Response> deleteRequest(
      {required String endPoint,
      required Object? dataDecode,
      required int errorCode}) async {
    try {
      final String? token = await _tokenManager.getToken();
      return _requestHandler(() async {
        return await httpClient.delete(
          Uri.parse('$baseNoWaitUrl$endPoint'),
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
