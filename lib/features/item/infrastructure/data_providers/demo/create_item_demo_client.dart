import '../../../../business/domain/entities/business.dart';
import '../../../domain/entities/item.dart';

class CreateItemDemoClient {
  Future<Map<String, dynamic>> createItem(Business business, String itemName,
      String description, String mainImagePath, ItemStatus status) async {
    final Map<String, dynamic> response = {
      'item': {
        'id': 'generated-item-id',
        'name': itemName,
        'description': description,
        'mainImagePath': mainImagePath,
        'duration': 3600, // 1 hour in seconds
        'status': status.toString().split('.').last, // Convert enum to string representation
      }
    };
    await Future.delayed(const Duration(seconds: 1));
    return response;
  }
}
