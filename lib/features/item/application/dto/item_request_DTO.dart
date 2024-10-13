class ItemRequestDTO {
  final String name;
  final String description;
  final int peoplePerShift;
  final String mainImagePath;
  final String secondaryImagePath;
  final int durationPerShifts; // En minutos
  final String status; // Representa el ItemStatus como String

  ItemRequestDTO({
    required this.name,
    required this.description,
    required this.peoplePerShift,
    required this.mainImagePath,
    required this.secondaryImagePath,
    required this.durationPerShifts,
    required this.status,
  });

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'description': description,
      'peoplePerShift': peoplePerShift,
      'mainImagePath': mainImagePath,
      'secondaryImagePath': secondaryImagePath,
      'durationPerShifts': durationPerShifts,
      'status': status,
    };
  }
}
