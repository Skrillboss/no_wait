import 'dart:convert';
import 'package:todo_turno/features/business/application/dto/add_item_request_DTO.dart';
import 'package:todo_turno/features/business/infrastructure/data_providers/repositories/create_item_client_repository.dart';
import '../../../../../core/custom_exception/custom_exception.dart';
import '../../../../../core/request_handler/request_handler.dart';

class CreateItemApiClient extends CreateItemClientRepository {
  final RequestHandler requestHandler = RequestHandler();

  @override
  Future<Map<String, dynamic>> createItem(
      AddItemRequestDTO addItemRequestDTO) async {
    try {
      final response = await requestHandler.postRequest(
          endPoint: '/business/item/add',
          dataDecode: addItemRequestDTO.toJson(),
          errorCode: 2000);
      return jsonDecode(response.body);
    } on CustomException {
      rethrow;
    }
  }
}