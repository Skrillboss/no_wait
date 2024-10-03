import 'package:todo_turno/features/business/application/dto/add_item_request_DTO.dart';

abstract class CreateItemClientRepository {
  Future<Map<String, dynamic>> createItem(AddItemRequestDTO addItemRequestDTO);
}
