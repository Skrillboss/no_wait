import '../../domain/repositories/delete_item_repository.dart';

class DeleteItem {
  final DeleteItemRepository repository;

  DeleteItem(this.repository);

  Future<void> call({required String itemId}) async {
    return await repository.delete(itemId);
  }
}
