import '../../../application/dto/RegisterUserDTO.dart';

class RegisterUserDemoClient {
  Future<Map<String, dynamic>> registerUser(
      RegisterUserDTO registerUserDTO) async {

    List<Map<String, dynamic>> paymentInfoList = registerUserDTO.paymentInfoList.isNotEmpty ?
    registerUserDTO.paymentInfoList.map((paymentInfo) {
      return {
        'paymentInfoId': '12345', // Puedes generar un ID único o usar uno real
        'cardNumber': paymentInfo!.cardNumber,
        'cardHolderName': paymentInfo.cardHolderName,
        'expiryDate': paymentInfo.expiryDate,
        'cardType': paymentInfo.cardType,
        'cvv': paymentInfo.cvv,
      };
    }).toList():
    [];

    // Crear el objeto de respuesta
    final Map<String, dynamic> response = {
      'userDTO': {
        'userId': '12345', // Puedes generar un ID único o usar uno real
        'name': registerUserDTO.name,
        'nickName': registerUserDTO.nickName,
        'email': registerUserDTO.email,
        'phoneNumber': registerUserDTO.phoneNumber,
        'userRole': registerUserDTO.userRole,
        'paymentInfoList': paymentInfoList, // Incluir la lista completa de PaymentInfo
        if (registerUserDTO.business != null)
          'business': {
            'businessId': '12345', // Puedes generar un ID único o usar uno real
            'cif': registerUserDTO.business!.cif,
            'name': registerUserDTO.business!.name,
            'imageUrl': 'urlExample.com', // Cambia esto según tus necesidades
            'phone': registerUserDTO.business!.phone,
            'address': registerUserDTO.business!.address,
            'email': registerUserDTO.business!.email,
            'createdAt': DateTime.now().toString(),
          }
      },
    };

    // Simula una espera para la solicitud
    await Future.delayed(const Duration(seconds: 1));
    return response;
  }
}
