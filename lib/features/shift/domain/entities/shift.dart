import 'package:todo_turno/features/business/domain/entities/business.dart';
import 'package:todo_turno/features/user/domain/entities/user.dart';
import '../../../item/domain/entities/item.dart';

enum ShiftStatus{
  active,
  inactive,
  expired,
  postponed,
  error
}

class Shift {
  final String shiftId; // Identificador del turno
  final DateTime shiftTime;
  final Business business;
  final Item item;
  final DateTime createAt;
  final DateTime notifyTime; // Tiempo para notificar al usuario
  final DateTime expirationTime;
  final Duration estimatedArrivalTime; // Tiempo estimado de llegada al negocio
  final User user; // Información del usuario
  final ShiftStatus status;
  final int shiftNumber;

  // Constructor de la clase Shift
  Shift({
    required this.business,
    required this.item,
    required this.shiftTime,
    required this.createAt,
    required this.notifyTime,
    required this.expirationTime,
    required this.estimatedArrivalTime,
    required this.shiftId,
    required this.user,
    required this.status,
    required this.shiftNumber
  });
}
