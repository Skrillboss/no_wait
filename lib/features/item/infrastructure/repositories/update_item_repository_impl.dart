import 'package:todo_turno/features/item/domain/entities/item.dart';
import 'package:todo_turno/features/item/domain/repositories/update_item_repository.dart';

import '../data_providers/demo/update_item_demo_client.dart';
import '../mappers/item_mapper.dart';

class UpdateItemRepositoryImpl implements UpdateItemRepository {
  final UpdateItemDemoClient apiClient;

  UpdateItemRepositoryImpl({required this.apiClient});

  @override
  Future<Item> update(Item item, String token) async {
    final Map<String, dynamic> data = await apiClient.updateItem(item, token);
    return ItemMapper.fromJson(data['item']);
  }
}
