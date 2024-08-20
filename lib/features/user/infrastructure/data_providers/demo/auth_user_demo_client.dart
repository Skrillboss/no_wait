class AuthUserDemoClient {
  Future<Map<String, dynamic>> login(String username, String password) async {
    final Map<String, dynamic> response = {
      'user': {
        'userId': '12345',
        'name': username,
        'nickName': username,
        'email': 'heredialuis20@gmail.com',
        'phoneNumber': '+34655817730',
        'paymentInfo': {
          'cardNumber': 'xxxx xxxx xxxx 9802',
          'cardHolderName': 'Luis Heredia',
          'expiryDate': '2025-12-31T23:59:59Z',
          'cardType': 'VISA',
          'cvv': '123',
        },
        'business': {
          'id': 'idBusinessDemo',
          'cif': 'B12345678',
          'name': 'Demo Business',
          'mainImagePath': 'https://example.com/image.png',
          'phone': '+0987654321',
          'address': '123 Demo Street, Demo City, DC',
          'email': 'contact@demobusiness.com',
          'createdAt': '2024-08-11T00:00:00Z',
          'items': [
            {
              'id': 'item1',
              'name': 'Item One',
              'description': 'Description for item one.',
              'mainImagePath': 'https://example.com/item1.png',
              'durationPerShifts': 120,
              'status': 'active',
              'shifts': []
            },
            {
              'id': 'item2',
              'name': 'Item Two',
              'description': 'Description for item two.',
              'mainImagePath': 'https://example.com/item2.png',
              'durationPerShifts': 120,
              'status': 'inactive',
              'shifts': []
            },
            {
              'id': 'item3',
              'name': 'Item Three',
              'description': 'Description for item three.',
              'mainImagePath': 'https://example.com/item3.png',
              'durationPerShifts': 120,
              'status': 'noStock',
              'shifts': []
            }
          ]
        }
      },
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
      'refreshToken':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c'
    };
    await Future.delayed(const Duration(seconds: 1));
    return response;
  }
}
