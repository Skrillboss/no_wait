import '../../../domain/entities/item.dart';

class UpdateItemDemoClient {
  Future<Map<String, dynamic>> updateItem(Item item, String token) async {
    final Map<String, dynamic> response = {
      'item': {
        'id': 'generated-item-id',
        'name': item.name,
        'description': item.description,
        'imageUrl': item.imageUrl,
        'duration': 3600, // 1 hour in seconds
        'status': item.status.toString().split('.').last,
      }
    };
    await Future.delayed(const Duration(seconds: 1));
    return response;
  }
}
