import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import 'package:todo_turno/core/request_handler_service/request_handler.dart';

class CreateShiftApiClient {
  final RequestHandler requestHandler = RequestHandler();

  Future<Map<String, dynamic>> createShift(
      String userId, String itemId, String token) async {
    try {
      final response = await requestHandler.postRequest(
          endPoint: '/creteShift',
          dataDecode: {'userId': userId, 'itemId': itemId},
          errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException {
      rethrow;
    }
  }
}
