import '../../../item/application/dto/item_request_DTO.dart';
import '../../../item/domain/entities/item.dart';

abstract class CreateItemRepository {
  Future<Item> create(
      {required String businessId, required ItemRequestDTO itemRequestDTO});
}
