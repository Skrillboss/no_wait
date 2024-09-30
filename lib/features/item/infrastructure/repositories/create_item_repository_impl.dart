import 'package:todo_turno/features/item/domain/entities/item.dart';
import '../../domain/repositories/create_item_repository.dart';
import '../data_providers/demo/create_item_demo_client.dart';
import '../mappers/item_mapper.dart';

class CreateItemRepositoryImpl implements CreateItemRepository {
  final CreateItemDemoClient apiClient;

  CreateItemRepositoryImpl({required this.apiClient});

  @override
  Future<Item> create(String businessId, String itemName, String description,
      String mainImagePath, ItemStatus status) async {
    final Map<String, dynamic> data = await apiClient.createItem(businessId, itemName, description, mainImagePath, status);
    final Item item = ItemMapper.fromJson(data['item']);
    return item;
  }
}
