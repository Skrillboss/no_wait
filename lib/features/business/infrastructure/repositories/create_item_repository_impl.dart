import 'package:todo_turno/features/item/domain/entities/item.dart';
import 'package:todo_turno/features/item/infrastructure/mappers/item_mapper.dart';
import '../../../item/application/dto/item_request_DTO.dart';
import '../../domain/repositories/create_item_repository.dart';
import '../data_providers/repositories/create_item_client_repository.dart';

class CreateItemRepositoryImpl extends CreateItemRepository {
  final CreateItemClientRepository apiClient;

  CreateItemRepositoryImpl({required this.apiClient});

  @override
  Future<Item> create({required String businessId, required ItemRequestDTO itemRequestDTO}) async{
    final Map<String, dynamic> data = await apiClient.createItem(businessId, itemRequestDTO);
    final Item item = ItemMapper.fromJson(data['itemResponseDTO']);
    return item;
  }
}