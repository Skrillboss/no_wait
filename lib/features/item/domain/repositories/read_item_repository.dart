import '../entities/item.dart';

abstract class ReadItemRepository {
  Future<Item> read(String itemId);
}
