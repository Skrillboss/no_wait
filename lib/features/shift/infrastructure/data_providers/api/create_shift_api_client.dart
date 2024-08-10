import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import '../../../../../core/request_handler/request_handler.dart';

class CreateShiftApiClient {
  final RequestHandler requestHandler = RequestHandler();

  Future<Map<String, dynamic>> createShift(
      String userId, String itemId) async {
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
