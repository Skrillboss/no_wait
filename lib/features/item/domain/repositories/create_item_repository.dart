import 'package:todo_turno/features/business/domain/entities/business.dart';
import '../entities/item.dart';

abstract class CreateItemRepository {
  Future<Item> create(Business business, String itemName, String description,
      String mainImagePath, ItemStatus status);
}
