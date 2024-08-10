import '../../domain/entities/item.dart';

abstract class UpdateItemRepository {
  Future<Item> update(Item item);
}
