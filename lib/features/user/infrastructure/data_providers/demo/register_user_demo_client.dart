import '../../../../business/domain/entities/business.dart';
import '../../../../paymentInfo/domain/entities/payment_info.dart';

class RegisterDemoClient {
  Future<Map<String, dynamic>> registerUser(
      String name,
      String nickName,
      String email,
      String phoneNumber,
      String password,
      PaymentInfo? paymentInfo,
      Business? business) async {
    final Map<String, dynamic> response = {
      'user': {
        'userId': '12345',
        'name': name,
        'nickName': nickName,
        'email': email,
        'phoneNumber': phoneNumber,
        if (paymentInfo != null)
          'paymentInfo': {
            'cardNumber': paymentInfo.cardNumber,
            'cardHolderName': paymentInfo.cardHolderName,
            'expiryDate': paymentInfo.expiryDate,
            'cardType': paymentInfo.cardType,
            'cvv': paymentInfo.cvv,
          }
      },
    };
    await Future.delayed(const Duration(seconds: 1));
    return response;
  }
}
