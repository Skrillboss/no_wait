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
  int numberPersonWaiting;
  int numberShiftWaiting;
  String imageUrl;
  Duration duration;
  ItemStatus status;
  List<Shift?> shifts;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.numberPersonWaiting,
    required this.numberShiftWaiting,
    required this.imageUrl,
    required this.duration,
    required this.status,
    required this.shifts
  });
}
