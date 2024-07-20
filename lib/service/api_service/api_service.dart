import 'dart:convert';

import 'package:dio/dio.dart';

import '../../config/dio/dio_config.dart';


enum ApiType {
  backend,
  paymentGateway,
}

class ApiService {
  final Dio _dio = DioConfig.createDio();
  final Dio _dioRetry = DioConfig.createDioRetry();
  final ApiType apiType;

  ApiService(this.apiType);

  Future<Response> _requestErrorHandler(
      Future<Response> Function() request, String methodName) async {
    try {
      var response = await request();
      if (response.statusCode == 200) {
        return response;
      } else {
        return Response;
      }
    }catch (e) {
      //se debe manejar este error
      rethrow;
    }
  }

  String _getApiUrl() {
    switch (apiType) {
      case ApiType.backend:
        return 'https://debo.colocar.mi.api.aqui.com';
      case ApiType.paymentGateway:
        return 'https://demo.colocar.la.api.pasareladepago.aqui.com';
      default:
        throw Exception('ApiType no soportado: $apiType');
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
  Future<Response> getRequest(String url, {String? token}) async {
    return _requestErrorHandler(
            () => _dioRetry.get(
          '${_getApiUrl()}$url',
          options: _getOptions(token),
        ),
        'getRequest');
  }

  /// ***************************************************************************
  ///                                      POST                                *
  ///***************************************************************************
  Future<Response> postRequest(
      {required String url, Object? data, String? token}) async {
    return _requestErrorHandler(
            () => _dio.post(
          '${_getApiUrl()}$url',
          data: data != null ? json.encode(data) : null,
          options: _getOptions(token),
        ),
        'postRequest');
  }

  /// ***************************************************************************
  ///                                      PATCH                               *
  ///***************************************************************************
  Future<Response> patchRequest(String url,
      {Object? data, String? token, bool retry = false}) async {
    var dioInstance = retry ? _dioRetry : _dio;
    return _requestErrorHandler(
            () => dioInstance.patch(
          '${_getApiUrl()}$url',
          data: data != null ? json.encode(data) : null,
          options: _getOptions(token),
        ),
        'patchRequest');
  }
}
