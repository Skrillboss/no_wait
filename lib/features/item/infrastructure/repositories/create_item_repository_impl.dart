import 'package:todo_turno/features/item/domain/entities/item.dart';
import 'package:todo_turno/features/item/infrastructure/data_providers/repositories/create_item_client_repository.dart';
import '../../domain/repositories/create_item_repository.dart';
import '../mappers/item_mapper.dart';

class CreateItemRepositoryImpl implements CreateItemRepository {
  final CreateItemClientRepository apiClient;

  CreateItemRepositoryImpl({required this.apiClient});

  @override
  Future<Item> create(String businessId, String itemName, String description,
      String mainImagePath, ItemStatus status) async {
    final Map<String, dynamic> data = await apiClient.createItem(businessId, itemName, description, mainImagePath, status);
    final Item item = ItemMapper.fromJson(data['item']);
    return item;
  }
}
