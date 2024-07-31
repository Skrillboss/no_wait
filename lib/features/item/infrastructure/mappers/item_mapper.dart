import '../../../shift/infrastructure/mappers/shift_mapper.dart';
import '../../domain/entities/item.dart';

class ItemMapper {
  static Map<String, dynamic> toJson(Item item) {
    return {
      'id': item.id,
      'name': item.name,
      'description': item.description,
      'imageUrl': item.imageUrl,
      'duration': item.duration.inSeconds, // Guardar duración en segundos
      'status': statusToString(item.status), // Convertir enum a string
      'shifts': ShiftMapper.listToJson(item.shifts)
    };
  }

  static Item fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      duration: Duration(seconds: json['duration']),
      // Convertir segundos a Duration
      status: stringToStatus(json['status']),
      // Convertir string a enum
      shifts: ShiftMapper.listFromJson(json['shifts'] as List<dynamic>),
    );
  }

  static String statusToString(ItemStatus status) {
    switch (status) {
      case ItemStatus.active:
        return 'active';
      case ItemStatus.inactive:
        return 'inactive';
      case ItemStatus.suspended:
        return 'suspended';
      case ItemStatus.noStock:
        return 'noStock';
      case ItemStatus.unhandledError:
        return 'unhandledError';
    }
  }

  static ItemStatus stringToStatus(String status) {
    switch (status) {
      case 'active':
        return ItemStatus.active;
      case 'inactive':
        return ItemStatus.inactive;
      case 'suspended':
        return ItemStatus.suspended;
      case 'noStock':
        return ItemStatus.noStock;
      case 'unhandledError':
        return ItemStatus.unhandledError;
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
