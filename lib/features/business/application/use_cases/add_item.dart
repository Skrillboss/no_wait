import 'package:todo_turno/features/business/domain/repositories/create_item_repository.dart';
import '../../../item/domain/entities/item.dart';
import '../dto/add_item_request_DTO.dart';

class AddItem {
  final CreateItemRepository repository;

  AddItem(this.repository);

  Future<Item> call({
    required AddItemRequestDTO addItemRequestDTO
}) async {
    return await repository.create(
        addItemRequestDTO: addItemRequestDTO
    );
  }
}