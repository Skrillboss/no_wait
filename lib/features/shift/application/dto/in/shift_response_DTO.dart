class ShiftResponseDTO {
  final String id; // Identificador del turno
  final String itemName; // Nombre del producto o servicio
  final String businessName; // Nombre del negocio
  final String shiftTime; // Tiempo aproximado del turno
  final int peopleInShift; // Número de personas en la cola del turno
  final String createAt; // Fecha y hora de creación del turno
  final String notifyTime; // Tiempo para notificar al usuario
  final double currentWaitingDuration; // Duración actual de la espera
  final String expirationTime; // Tiempo de expiración del turno
  final double estimatedArrivalTime; // Tiempo estimado de llegada
  final String status; // Estado del turno (enum ShiftStatus)
  final int shiftNumber; // Número de turno

  ShiftResponseDTO({
    required this.id,
    required this.itemName,
    required this.businessName,
    required this.shiftTime,
    required this.peopleInShift,
    required this.createAt,
    required this.notifyTime,
    required this.currentWaitingDuration,
    required this.expirationTime,
    required this.estimatedArrivalTime,
    required this.status,
    required this.shiftNumber,
  });
}
