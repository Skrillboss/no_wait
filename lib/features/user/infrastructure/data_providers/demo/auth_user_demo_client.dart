class AuthUserDemoClient {
  Future<Map<String, dynamic>> login(String username, String password) async {
    final Map<String, dynamic> response = {
      'user': {
        'userId': '12345',
        'name': '$username (name)',
        'nickName': '$username (name)',
        'email': 'john.doe@example.com',
        'phoneNumber': '+1234567890',
        'paymentInfo': {
          'cardNumber': '4111111111111111',
          'cardHolderName': 'John Doe',
          'expiryDate': '2025-12-31T23:59:59Z',
          'cardType': 'VISA',
          'cvv': '123',
        }
      },
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c'
    };

    return response;
  }
}
