class AuthRefreshTokenDemoClient {
  Future<Map<String, dynamic>> login(String refreshToken) async {
    final Map<String, dynamic> response = {
      'user': {
        'userId': '12345',
        'name': 'Luis',
        'nickName': 'Luisillo',
        'email': 'heredialuis20@gmail.com',
        'phoneNumber': '+34655817730',
        'paymentInfo': {
          'cardNumber': 'xxxx xxxx xxxx 9802',
          'cardHolderName': 'Luis Heredia',
          'expiryDate': '2025-12-31T23:59:59Z',
          'cardType': 'VISA',
          'cvv': '123',
        }
      },
      'token':
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
      'refreshToken':
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c'
    };
    return response;
  }
}
