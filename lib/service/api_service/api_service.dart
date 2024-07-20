import 'dart:convert';

import 'package:dio/dio.dart';

import '../../config/dio/dio_config.dart';

// Use UpperCamelCase for enum names
enum ApiType {
  backend,
  paymentGateway,
}

class ApiService {
  final Dio _dio = DioConfig.createDio();
  final Dio _dioRetry = DioConfig.createDioRetry();
  final ApiType apiType;

  ApiService(this.apiType);

  // Improved error handling with more specific error types
  Future<Response<dynamic>> _requestErrorHandler<T>(
      Future<Response<T>> Function() request, String methodName) async {
    try {
      var response = await request();
      if (response.statusCode == 200) {
        return response;
      } else {
        // Handle non-200 responses with more informative error
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Request failed with status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      // Handle DioError specifically, log the error, and rethrow
      print('Error in $methodName: ${e.message}');
      rethrow;
    } catch (e) {
      // Handle other unexpected errors
      print('Unexpected error in $methodName: $e');
      rethrow;
    }
  }

  // Use a more descriptive name for the method
  String _getBaseUrlForApiType() {
    switch (apiType) {
      case ApiType.backend:
      // Use placeholders for actual API URLs
        return 'https://api.backend.com';
      case ApiType.paymentGateway:
        return 'https://api.paymentgateway.com';
      default:
        throw UnsupportedError('Unsupported ApiType: $apiType');
    }
  }

  Options _getOptions(String? token) {
    return Options(
      headers: {
        if (token != null) 'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
  }

  /// ***************************************************************************
  ///                                      GET                                 *
  ///***************************************************************************
  Future<Response<dynamic>> getRequest(String path, {String? token}) async {
    return _requestErrorHandler(
            () => _dioRetry.get(
          '${_getBaseUrlForApiType()}$path',
          options: _getOptions(token),
        ),
        'getRequest');
  }

  /// ***************************************************************************
  ///                                      POST                                *
  ///***************************************************************************
  Future<Response<dynamic>> postRequest(
      {required String path, Map<String, dynamic>? data, String? token}) async {
    return _requestErrorHandler(
            () => _dio.post(
          '${_getBaseUrlForApiType()}$path',
          data: data != null ? json.encode(data) : null,
          options: _getOptions(token),
        ),
        'postRequest');
  }

  /// ***************************************************************************
  ///                                      PATCH                               *
  ///***************************************************************************
  Future<Response<dynamic>> patchRequest(String path,
      {Map<String, dynamic>? data, String? token, bool retry = false}) async {
    var dioInstance = retry ? _dioRetry : _dio;
    return _requestErrorHandler(
            () => dioInstance.patch(
          '${_getBaseUrlForApiType()}$path',
          data: data != null ? json.encode(data) : null,
          options: _getOptions(token),
        ),
        'patchRequest');
  }
}