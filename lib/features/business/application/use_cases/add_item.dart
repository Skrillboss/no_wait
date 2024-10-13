import 'package:todo_turno/features/business/domain/repositories/create_item_repository.dart';
import '../../../item/application/dto/item_request_DTO.dart';
import '../../../item/domain/entities/item.dart';

class AddItem {
  final CreateItemRepository repository;

  AddItem(this.repository);

  Future<Item> call({required String businessId,
    required ItemRequestDTO itemRequestDTO
}) async {
    return await repository.create(
        businessId: businessId,
        itemRequestDTO: itemRequestDTO
    );
  }
}