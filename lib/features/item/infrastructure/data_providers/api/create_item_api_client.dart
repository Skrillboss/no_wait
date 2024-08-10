import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import 'package:todo_turno/features/item/infrastructure/mappers/item_mapper.dart';
import '../../../../../core/request_handler/request_handler.dart';
import '../../../../business/domain/entities/business.dart';
import '../../../../business/infrastructure/mappers/business_mapper.dart';
import '../../../domain/entities/item.dart';

class CreateItemApiClient {
  final RequestHandler requestHandler = RequestHandler();

  Future<Map<String, dynamic>> createItem(
      Business business,
      String itemName,
      String description,
      String imageUrl,
      ItemStatus status,
      String token) async {
    try {
      final response = await requestHandler.postRequest(
          endPoint: 'createItem',
          dataDecode: {
            'business': BusinessMapper.toJson(business),
            'itemName': itemName,
            'description': description,
            'imageUrl': imageUrl,
            'itemStatus': ItemMapper.statusToString(status),
          },
          errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException {
      rethrow;
    }
  }
}
