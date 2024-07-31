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
  final DateTime createAt;
  final DateTime notifyTime; // Tiempo para notificar al usuario
  final DateTime expirationTime;
  final Duration estimatedArrivalTime; // Tiempo estimado de llegada al negocio
  final ShiftStatus status;
  final int shiftNumber;

  // Constructor de la clase Shift
  Shift({
    required this.shiftTime,
    required this.createAt,
    required this.notifyTime,
    required this.expirationTime,
    required this.estimatedArrivalTime,
    required this.shiftId,
    required this.status,
    required this.shiftNumber
  });
}
