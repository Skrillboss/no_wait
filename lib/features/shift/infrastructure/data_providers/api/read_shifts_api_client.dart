import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import 'package:todo_turno/core/request_handler_service/request_handler.dart';

class ReadShiftsApiClient {
  final RequestHandler requestHandler = RequestHandler();

  Future<Map<String, dynamic>> getShifts(String userId, String token) async {
    try {
      final response = await requestHandler.getRequest(
          endPoint: '/shifts/$userId', errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException {
      rethrow;
    }
  }
}
