import '../../domain/entities/item.dart';
import '../../domain/repositories/create_item_repository.dart';

class CreateItem {
  final CreateItemRepository repository;

  CreateItem(this.repository);

  Future<Item> call(
      {required String businessId,
      required String itemName,
      required String description,
      required String mainImagePath,
      required ItemStatus status}) async {
    return await repository.create(
        businessId, itemName, description, mainImagePath, status);
  }
}
