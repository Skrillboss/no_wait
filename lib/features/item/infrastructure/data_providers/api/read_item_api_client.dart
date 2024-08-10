import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import '../../../../../core/request_handler/request_handler.dart';

class ReadItemApiClient {
  final RequestHandler requestHandler = RequestHandler();

  Future<Map<String, dynamic>> getItem(String itemId, String token) async {
    try {
      final response = await requestHandler.getRequest(
          endPoint: '/items/$itemId', errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException {
      rethrow;
    }
  }
}
