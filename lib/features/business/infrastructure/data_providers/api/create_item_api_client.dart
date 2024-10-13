import 'dart:convert';
import 'package:todo_turno/features/business/infrastructure/data_providers/repositories/create_item_client_repository.dart';
import '../../../../../core/custom_exception/custom_exception.dart';
import '../../../../../core/request_handler/request_handler.dart';
import '../../../../item/application/dto/item_request_DTO.dart';

class CreateItemApiClient extends CreateItemClientRepository {
  final RequestHandler requestHandler = RequestHandler();

  @override
  Future<Map<String, dynamic>> createItem(String businessId,
      ItemRequestDTO itemRequestDTO) async {
    try {
      final response = await requestHandler.postRequest(
          endPoint: '/business/$businessId/item/add',
          dataDecode: itemRequestDTO.toJson(),
          errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException {
      rethrow;
    }
  }
}