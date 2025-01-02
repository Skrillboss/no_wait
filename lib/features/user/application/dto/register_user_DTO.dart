import 'package:todo_turno/features/role/application/dto/register_role_DTO.dart';

import '../../../business/application/dto/register_business_request_DTO.dart';
import '../../../paymentInfo/application/dto/register_payment_info_DTO.dart';

class RegisterUserDTO {
  final String name;
  final String nickName;
  final String email;
  final String phoneNumber;
  final String password;
  final RegisterRoleDTO userRole;
  final List<RegisterPaymentInfoDTO?> paymentInfoList;
  final RegisterBusinessRequestDTO? business;

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
      'roleRequestDTO': userRole,
      'paymentInfoRequestDTOList': paymentInfoList
          .where((i) => i != null)
          .map((i) => i!.toJson())
          .toList(),
      'businessRequestDTO': business?.toJson(),
    };
  }
}
