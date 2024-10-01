import '../../../shift/domain/entities/shift.dart';

enum ItemStatus{
  ACTIVE,
  INACTIVE,
  SUSPENDED,
  NOSTOCK,
  UNHANDLEDERROR
}

class Item {
  final String id;
  String name;
  String description;
  int numberPeopleWaiting;
  int peoplePerShift;
  int numberShiftsWaiting;
  double? rating;
  String mainImagePath;
  String? secondaryImagePath;
  Duration currentWaitingDuration;
  Duration durationPerShifts;
  ItemStatus status;
  List<Shift?> shifts;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.numberPeopleWaiting,
    required this.peoplePerShift,
    required this.numberShiftsWaiting,
    this.rating,
    required this.mainImagePath,
    this.secondaryImagePath,
    required this.currentWaitingDuration,
    required this.durationPerShifts,
    required this.status,
    required this.shifts
  });
}
