import '../../../../item/application/dto/item_request_DTO.dart';

abstract class CreateItemClientRepository {
  Future<Map<String, dynamic>> createItem(String businessId, ItemRequestDTO itemRequestDTO);
}
