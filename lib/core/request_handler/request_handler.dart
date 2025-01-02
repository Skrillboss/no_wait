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
  final String baseNoWaitUrl = 'https://fc97-90-74-245-177.ngrok-free.app';
  final JwtTokenManager _tokenManager = JwtTokenManager();

  /// ***************************************************************************
  ///                               USE REFRESH TOKEN                          *
  ///***************************************************************************

  Future<void> _refreshTokenRequest() async {
    try {
      final String? refreshToken = await _tokenManager.getRefreshToken();
      final String? token = await _tokenManager.getToken();
      Response response = await patchRequest(
          endPoint: '/user/refreshToken',
          dataDecode: {'accessToken': token},
          errorCode: 2000,
          isFormData: true,
          refreshToken: refreshToken);

      final String jwtToken = jsonDecode(response.body)['token'];
      final String jwtRefreshToken = jsonDecode(response.body)['refreshToken'];
      _tokenManager.saveToken(jwtToken);
      _tokenManager.saveRefreshToken(jwtRefreshToken);
    } on CustomException {
      rethrow;
    } catch (e) {
      print('Error faltante de controlar 000001');
    }
  }

  /// ***************************************************************************
  ///                            REQUEST HANDLER                               *
  ///***************************************************************************

  Future<Response> _requestHandler(
      Future<Response> Function() requestFunction) async {
    Response response = await requestFunction();

    if (!(response.statusCode >= 200 && response.statusCode < 300)) {
      try {
        final CustomException customException =
        CustomException.fromJson(jsonDecode(response.body));

        for (var appError in customException.errorCodes) {
          if (appError == 'APP-3001') {
            await _refreshTokenRequest();
          } else {
            throw customException;
          }
        }
      } on CustomException catch (customException) {
        print('Error parsing response or handling exception: ${customException.toString()}');
        rethrow;
      } on Exception catch (e){
        print('Error por identificar y catalogar: ' + e.toString());
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
  }

  /// ***************************************************************************
  ///                                      POST                                *
  ///***************************************************************************

  Future<Response> postRequest({
    String? baseApiUrl,
    required String endPoint,
    Object? dataDecode,
    required int errorCode,
    bool isFormData = false,
    bool useToken = true,
  }) async {
      return await _requestHandler(() async {
        final String? token = await _tokenManager.getToken();
        final String baseUrl = baseApiUrl ?? baseNoWaitUrl;

        if (isFormData && dataDecode is Map<String, String>) {
          // if form-data
          var request =
              http.MultipartRequest('POST', Uri.parse('$baseUrl$endPoint'));

          request.headers.addAll({
            if (useToken && token != null) 'Authorization': 'Bearer $token',
          });

          request.fields.addAll(dataDecode);

          var streamedResponse = await request.send();
          return await http.Response.fromStream(streamedResponse);
        } else {
          // if JSON
          return await _requestHandler(()async{
            return httpClient.post(
              Uri.parse('$baseUrl$endPoint'),
              headers: {
                'Content-Type': 'application/json',
                if (useToken && token != null) 'Authorization': 'Bearer $token',
              },
              body: jsonEncode(dataDecode),
            );
          });
        }
      });
  }

  /// ***************************************************************************
  ///                                      DELETE                              *
  ///***************************************************************************

  Future<Response> deleteRequest(
      {required String endPoint,
      required Object? dataDecode,
      required int errorCode}) async {
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
  }


  /// ***************************************************************************
  ///                                      PATCH                               *
  ///***************************************************************************

  Future<Response> patchRequest({
    String? baseApiUrl,
    required String endPoint,
    Object? dataDecode,
    required int errorCode,
    bool isFormData = false,
    String? refreshToken
  }) async {
      return await _requestHandler(() async {
        final String? accessToken = await _tokenManager.getToken();
        final String baseUrl = baseApiUrl ?? baseNoWaitUrl;

        if (isFormData && dataDecode is Map) {
          // Convertir dataDecode a Map<String, String> explícitamente
          final Map<String, String> formData = Map<String, String>.from(dataDecode);

          // if form-data
          var request = http.MultipartRequest('PATCH', Uri.parse('$baseUrl$endPoint'));

          request.headers.addAll({
            if ((refreshToken != null) && accessToken != null) 'Authorization': 'Bearer $refreshToken',
          });

          request.fields.addAll(formData);

          var streamedResponse = await request.send();
          return await http.Response.fromStream(streamedResponse);
        } else {
          // if JSON
          return await httpClient.patch(
            Uri.parse('$baseUrl$endPoint'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $accessToken',
            },
            body: jsonEncode(dataDecode),
          );
        }
      });
  }
}