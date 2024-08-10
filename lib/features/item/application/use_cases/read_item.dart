import '../../domain/entities/item.dart';
import '../../domain/repositories/read_item_repository.dart';

class ReadItem {
  final ReadItemRepository repository;

  ReadItem(this.repository);

  Future<Item> call({required String itemId}) async {
    return await repository.read(itemId);
  }
}
