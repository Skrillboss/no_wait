import 'package:todo_turno/features/business/application/dto/add_item_request_DTO.dart';

import '../../../item/domain/entities/item.dart';

abstract class CreateItemRepository {
  Future<Item> create({required AddItemRequestDTO addItemRequestDTO});
}