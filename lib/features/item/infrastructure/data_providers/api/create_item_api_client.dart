import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import 'package:todo_turno/features/item/infrastructure/mappers/item_mapper.dart';
import '../../../../../core/request_handler/request_handler.dart';
import '../../../domain/entities/item.dart';
import '../repositories/create_item_client_repository.dart';

class CreateItemApiClient extends CreateItemClientRepository{
  final RequestHandler requestHandler = RequestHandler();

  @override
  Future<Map<String, dynamic>> createItem(
      String businessId,
      String itemName,
      String description,
      String mainImagePath,
      ItemStatus status) async {
    try {
      final response = await requestHandler.postRequest(
          endPoint: 'createItem',
          dataDecode: {
            'businessId': businessId,
            'itemName': itemName,
            'description': description,
            'mainImagePath': mainImagePath,
            'itemStatus': ItemMapper.statusToString(status),
          },
          errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException {
      rethrow;
    }
  }
}
