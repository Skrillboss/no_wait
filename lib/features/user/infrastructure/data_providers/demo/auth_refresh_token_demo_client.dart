class AuthRefreshTokenDemoClient {
  Future<Map<String, dynamic>> login(String refreshToken) async {
    final Map<String, dynamic> response = {
      'user': {
        'id': '12345',
        'name': 'Luis',
        'nickName': 'Luisillo',
        'email': 'heredialuis20@gmail.com',
        'phoneNumber': '+34655817730',
        'userRole': 'ADMIN',
        'paymentInfoList': [{
          'paymentInfoId': '12345',
          "cardNumber": "1234567812345678",
          "cardHolderName": "Cristina Perez",
          "expiryDate": "2024-12-31",
          "cardType": "Visa",
          "cvv": "123"
        },
          {
            'paymentInfoId': '67890',
            "cardNumber": "1234567812345678",
            "cardHolderName": "Cristina Perez",
            "expiryDate": "2024-12-31",
            "cardType": "Visa",
            "cvv": "123"
          }],
        "business": {
          'businessId': '12345',
          "cif": "cifInventado",
          "name": "NombreInventado",
          "imageUrl": "https://imagen-example.com",
          "phone": "92348572349",
          "address": "Calle Illescas 121 3A",
          "email": "empresaEmpresarial@gmail.com",
          "createdAt": "2023-09-04T12:00:00Z"
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
