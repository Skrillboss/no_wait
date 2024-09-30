import '../entities/item.dart';

abstract class CreateItemRepository {
  Future<Item> create(String businessId, String itemName, String description,
      String mainImagePath, ItemStatus status);
}
