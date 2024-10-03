class CreateItemRequestDTO {
  final String name;
  final String description;
  final int peoplePerShift;
  final String mainImagePath;
  final String secondaryImagePath;
  final int durationPerShifts; // En minutos
  final String status; // Representa el ItemStatus como String

  CreateItemRequestDTO({
    required this.name,
    required this.description,
    required this.peoplePerShift,
    required this.mainImagePath,
    required this.secondaryImagePath,
    required this.durationPerShifts,
    required this.status,
  });
}
