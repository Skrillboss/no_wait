class ReadItemDemoClient {
  Future<Map<String, dynamic>> getItem(String itemId) async {
    final Map<String, dynamic> response = {
      'item': {
        'id': itemId,
        'name': 'Tifón',
        'description':
            'En Tifón llegarás a subir a más de 15 metros de altura a la vez que la atracción se balancea y gira sobre sí misma de la forma más divertida. Esta atracción, que cuenta con asientos similares a los de una moto pero con arneses automáticos traseros para maximizar las sensaciones, podríamos considerarla parecida a La Máquina aunque Tifón tiene un escalón por debajo de adrenalina y emoción, pero lo bueno de esta atracción es que los asientos miran hacia fuera para minimizar la posible sensación de mareo que podría llegar a ocasionarte La Máquina.',
        'numberClientsWaiting': 6,
        'clientsPerShift': 2,
        'numberShiftWaiting': 3,
        'rating': 4.3,
        'mainImagePath':
            'https://th.bing.com/th/id/R.760b1b3d668dad9e84e6230cf43cf061?rik=2SRf7Z%2bRKwLmoQ&riu=http%3a%2f%2fc8.alamy.com%2fcomp%2fBHD0WN%2fattraction-in-parque-de-atracciones-de-madrid-madrid-amusement-park-BHD0WN.jpg&ehk=P8oFuV6g13Oo3eKcyG67c2WGtGTGHLOz4FS0XfgWVvI%3d&risl=&pid=ImgRaw&r=0',
        'secondaryImagePath':
            'https://www.parkmania.pl/image.php?type=photo&id=143_13283&size=517x377&method=cutout',
        'currentWaitingDuration': 2026,
        'durationPerShifts': 600, // 1 hour in seconds
        'status': 'active', // Usa el valor del enum como cadena
        'shifts': []
      }
    };

    await Future.delayed(const Duration(seconds: 5));
    return response;
  }
}
