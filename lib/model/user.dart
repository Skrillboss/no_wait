import 'package:todo_turno/model/payment_info.dart';

class User {
  final String userId; // Identificador del usuario
  final String name; // Nombre del usuario
  final String email; // Correo electrónico del usuario
  final String phoneNumber; // Número de teléfono del usuario
  final PaymentInfo paymentInfo; // Información de pago del usuario

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.paymentInfo,
  });
}
