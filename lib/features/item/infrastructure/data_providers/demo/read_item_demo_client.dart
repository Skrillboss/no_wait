class ReadItemDemoClient {
  Future<Map<String, dynamic>> getItem(String itemId, String token) async {
    final Map<String, dynamic> response = {
      'item': {
        'id': itemId,
        'name': 'Demo Item',
        'description': 'This is a demo item description.',
        'imageUrl': 'https://example.com/demo-item.jpg',
        'duration': 3600, // 1 hour in seconds
        'status': 'active' // Usa el valor del enum como cadena
      }
    };

    await Future.delayed(const Duration(seconds: 1));
    return response;
  }
}
