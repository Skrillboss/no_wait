import '../../../domain/entities/item.dart';

abstract class CreateItemClientRepository {
  Future<Map<String, dynamic>> createItem(String businessId, String itemName,
      String description, String mainImagePath, ItemStatus status);
}
