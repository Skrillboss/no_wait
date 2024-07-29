import 'package:todo_turno/features/paymentInfo/domain/entities/payment_info.dart';
import '../../../business/domain/entities/business.dart';

class User {
  final String userId; // Identificador del usuario
  final String name;
  final String nickName;
  final String email; // Correo electrónico del usuario
  final String phoneNumber; // Número de teléfono del usuario
  final PaymentInfo? paymentInfo; // Información de pago del usuario
  final Business? business;

  User({
    required this.userId,
    required this.name,
    required this.nickName,
    required this.email,
    required this.phoneNumber,
    required this.paymentInfo,
    required this.business
  });
}
