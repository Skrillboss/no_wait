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
        'mainImagePath': 'https://th.bing.com/th/id/R.760b1b3d668dad9e84e6230cf43cf061?rik=2SRf7Z%2bRKwLmoQ&riu=http%3a%2f%2fc8.alamy.com%2fcomp%2fBHD0WN%2fattraction-in-parque-de-atracciones-de-madrid-madrid-amusement-park-BHD0WN.jpg&ehk=P8oFuV6g13Oo3eKcyG67c2WGtGTGHLOz4FS0XfgWVvI%3d&risl=&pid=ImgRaw&r=0',
        'duration': 3600, // 1 hour in seconds
        'status': 'active', // Usa el valor del enum como cadena
        'shifts': []
      }
    };

    await Future.delayed(const Duration(seconds: 5));
    return response;
  }
}
