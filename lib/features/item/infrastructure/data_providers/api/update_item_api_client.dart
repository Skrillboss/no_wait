import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import 'package:todo_turno/features/item/infrastructure/mappers/item_mapper.dart';
import '../../../../../core/request_handler/request_handler.dart';
import '../../../domain/entities/item.dart';

class UpdateItemApiClient {
  final RequestHandler requestHandler = RequestHandler();

  Future<Map<String, dynamic>> updateItem(Item item) async {
    try{
      final response = await requestHandler.postRequest(
          endPoint: '/createItem',
          dataDecode: {'item': ItemMapper.toJson(item)},
          errorCode: 2000);
      return jsonDecode(response.body);
    }on CustomException{
      rethrow;
    }
  }
}
