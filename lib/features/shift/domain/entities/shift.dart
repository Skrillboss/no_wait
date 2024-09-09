enum ShiftStatus { active, inactive, expired, postponed, error }

class Shift {
  final String shiftId; // Identificador del turno
  final String itemName;
  final String businessName;
  final DateTime shiftTime;
  final int peopleInShift;
  final DateTime createAt;
  final DateTime notifyTime; // Tiempo para notificar al usuario
  final Duration currentWaitingDuration;
  final DateTime expirationTime;
  final Duration estimatedArrivalTime; // Tiempo estimado de llegada al negocio
  final ShiftStatus status;
  final int shiftNumber;

  // Constructor de la clase Shift
  Shift(
      {required this.shiftTime,
      required this.itemName,
      required this.businessName,
      required this.createAt,
      required this.peopleInShift,
      required this.notifyTime,
      required this.currentWaitingDuration,
      required this.expirationTime,
      required this.estimatedArrivalTime,
      required this.shiftId,
      required this.status,
      required this.shiftNumber});
}
