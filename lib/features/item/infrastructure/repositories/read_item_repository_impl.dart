import '../../domain/entities/item.dart';
import '../../domain/repositories/read_item_repository.dart';
import '../data_providers/demo/read_item_demo_client.dart';
import '../mappers/item_mapper.dart';

class ReadItemRepositoryImpl implements ReadItemRepository {
  final ReadItemDemoClient apiClient;

  ReadItemRepositoryImpl({required this.apiClient});

  @override
  Future<Item> read(String itemId, String token) async {
    final Map<String, dynamic> data = await apiClient.getItem(itemId, token);
    final Item item = ItemMapper.fromJson(data['item']);
    return item;
  }
}
