import 'package:todo_turno/features/item/domain/repositories/delete_item_repository.dart';

import '../data_providers/delete/delete_item_demo_client.dart';

class DeleteItemRepositoryImpl implements DeleteItemRepository{
  final DeleteItemDemoClient apiClient;

  DeleteItemRepositoryImpl({required this.apiClient});

  @override
  Future<void> delete(String itemId, String token) async {
    await apiClient.deleteItem(itemId, token);
  }

}