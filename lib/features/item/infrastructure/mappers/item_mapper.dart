import '../../../shift/infrastructure/mappers/shift_mapper.dart';
import '../../domain/entities/item.dart';

class ItemMapper {
  static Map<String, dynamic> toJson(Item item) {
    return {
      'id': item.id,
      'name': item.name,
      'description': item.description,
      'numberClientsWaiting': item.numberPeopleWaiting,
      'numberShiftWaiting': item.numberShiftsWaiting,
      'rating': item.rating,
      'mainImagePath': item.mainImagePath,
      'secondaryImagePath': item.secondaryImagePath,
      'currentWaitingDuration': item.currentWaitingDuration,
      'durationPerShifts': item.durationPerShifts.inSeconds,
      // Guardar duración en segundos
      'status': statusToString(item.status),
      // Convertir enum a string
      'shifts': ShiftMapper.listToJson(item.shifts)
    };
  }

  static Item fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      numberPeopleWaiting: json['numberPeopleWaiting'],
      peoplePerShift: json['peoplePerShift'],
      numberShiftsWaiting: json['numberShiftsWaiting'],
      rating: json['rating'],
      mainImagePath: json['mainImagePath'],
      secondaryImagePath: json['secondaryImagePath'],
      currentWaitingDuration: Duration(seconds: json['currentWaitingDuration']),
      durationPerShifts: Duration(seconds: json['durationPerShifts']),
      // Convertir segundos a Duration
      status: stringToStatus(json['status']),
      // Convertir string a enum
      shifts: ShiftMapper.listFromJson(json['shifts'] as List<Map<String, dynamic>>),
    );
  }

  static String statusToString(ItemStatus status) {
    switch (status) {
      case ItemStatus.ACTIVE:
        return 'active';
      case ItemStatus.INACTIVE:
        return 'inactive';
      case ItemStatus.SUSPENDED:
        return 'suspended';
      case ItemStatus.NOSTOCK:
        return 'noStock';
      case ItemStatus.UNHANDLEDERROR:
        return 'unhandledError';
    }
  }

  static ItemStatus stringToStatus(String status) {
    switch (status) {
      case 'active':
        return ItemStatus.ACTIVE;
      case 'inactive':
        return ItemStatus.INACTIVE;
      case 'suspended':
        return ItemStatus.SUSPENDED;
      case 'noStock':
        return ItemStatus.NOSTOCK;
      case 'unhandledError':
        return ItemStatus.UNHANDLEDERROR;
      default:
        throw ArgumentError('Invalid item status: $status');
    }
  }

  static List<Map<String, dynamic>> listToJson(List<Item?> items) {
    return items
        .where((item) => item != null)
        .map((item) => toJson(item!))
        .toList();
  }

  static List<Item> listFromJson(List<dynamic> jsonItem) {
    return jsonItem
        .map((json) => fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
