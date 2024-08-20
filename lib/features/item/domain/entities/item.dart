import '../../../shift/domain/entities/shift.dart';

enum ItemStatus{
  active,
  inactive,
  suspended,
  noStock,
  unhandledError
}

class Item {
  final String id;
  String name;
  String description;
  int numberClientsWaiting;
  int clientsPerShift;
  int numberShiftsWaiting;
  double? rating;
  String mainImagePath;
  Duration duration;
  ItemStatus status;
  List<Shift?> shifts;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.numberClientsWaiting,
    required this.clientsPerShift,
    required this.numberShiftsWaiting,
    this.rating,
    required this.mainImagePath,
    required this.duration,
    required this.status,
    required this.shifts
  });
}
