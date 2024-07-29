import '../../domain/entities/item.dart';
import '../../domain/repositories/update_item_repository.dart';

class UpdateItem {
  final UpdateItemRepository repository;

  UpdateItem(this.repository);

  Future<Item> call({required Item item, required String token}) async {
    return await repository.update(item, token);
  }
}