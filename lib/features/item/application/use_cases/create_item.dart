import '../../../business/domain/entities/business.dart';
import '../../domain/entities/item.dart';
import '../../domain/repositories/create_item_repository.dart';

class CreateItem {
  final CreateItemRepository repository;

  CreateItem(this.repository);

  Future<Item> call(
      {required Business business,
      required String itemName,
      required String description,
      required String imageUrl,
      required ItemStatus status}) async {
    return await repository.create(
        business, itemName, description, imageUrl, status);
  }
}
