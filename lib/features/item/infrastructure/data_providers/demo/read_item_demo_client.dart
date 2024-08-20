class ReadItemDemoClient {
  Future<Map<String, dynamic>> getItem(String itemId) async {
    final Map<String, dynamic> response = {
      'item': {
        'id': itemId,
        'name': 'Demo Item',
        'description': 'This is a demo item description.',
        'numberClientsWaiting': 6,
        'clientsPerShift': 2,
        'numberShiftWaiting': 3,
        'rating': 4.3,
        'imageUrl': 'https://example.com/demo-item.jpg',
        'duration': 3600, // 1 hour in seconds
        'status': 'active', // Usa el valor del enum como cadena
        'shifts': []
      }
    };

    await Future.delayed(const Duration(seconds: 5));
    return response;
  }
}
