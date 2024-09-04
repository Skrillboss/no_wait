class AuthUserDemoClient {
  Future<Map<String, dynamic>> login(String username, String password) async {
    final Map<String, dynamic> response = {
      'user': {
        'id': '12345',
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
