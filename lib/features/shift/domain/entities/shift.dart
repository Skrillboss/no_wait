enum ShiftStatus { active, inactive, expired, postponed, error }

class Shift {
  final String shiftId; // Identificador del turno
  final String itemName; // nombre del producto o servicio que vas a reclamar por el turno
  final String businessName;
  final DateTime shiftTime; // cuanto tarda aproximadamente turno a turno
  final int peopleInShift; // cantidad de personas esperando actualmente su turno
  final DateTime createAt;
  final DateTime notifyTime; // Tiempo para notificar al usuario
  final Duration currentWaitingDuration; // actual tiempo de duracion para que sea tu turno
  final DateTime expirationTime;
  final Duration estimatedArrivalTime; // Tiempo estimado de llegada al negocio para reclamar tu turno
  final ShiftStatus status;
  final int shiftNumber; // numero de turno

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
