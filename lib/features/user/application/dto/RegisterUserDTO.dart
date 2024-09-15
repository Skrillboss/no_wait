import '../../../business/application/dto/RegisterBusinessDTO.dart';
import '../../../paymentInfo/application/dto/RegisterPaymentInfoDTO.dart';

class RegisterUserDTO {
  final String name;
  final String nickName;
  final String email;
  final String phoneNumber;
  final String password;
  final String userRole;
  final List<RegisterPaymentInfoDTO?> paymentInfoList; // Lista de PaymentInfo
  final RegisterBusinessDTO? business; // Objeto Business (opcional)

  RegisterUserDTO({
    required this.name,
    required this.nickName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.userRole,
    required this.paymentInfoList,
    this.business,
  }) {
    // Validación para ADMIN
    if (userRole == 'ADMIN') {
      if (paymentInfoList.isEmpty) {
        throw ArgumentError('ADMIN role requires at least one PaymentInfo.');
      }
      if (business == null) {
        throw ArgumentError('ADMIN role requires a Business.');
      }
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nickName': nickName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'userRole': userRole,
      'paymentInfo': paymentInfoList.isNotEmpty ? paymentInfoList.map((i) => i!.toJson()).toList(): [],
      'business': business?.toJson(),
    };
  }
}
