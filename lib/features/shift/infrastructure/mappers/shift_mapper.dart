import '../../domain/entities/shift.dart';

class ShiftMapper {
  static Map<String, dynamic> toJson(Shift shift) {
    return {
      'shiftId': shift.shiftId,
      'shiftTime': shift.shiftTime.toIso8601String(),
      'createAt': shift.createAt.toIso8601String(),
      'notifyTime': shift.notifyTime.toIso8601String(),
      'expirationTime': shift.expirationTime.toIso8601String(),
      'estimatedArrivalTime': shift.estimatedArrivalTime.inMinutes,
      'status': shift.status.toString().split('.').last,
      'shiftNumber': shift.shiftNumber,
    };
  }

  static Shift fromJson(Map<String, dynamic> json) {
    return Shift(
      shiftId: json['shiftId'],
      shiftTime: DateTime.parse(json['shiftTime']),
      createAt: DateTime.parse(json['createAt']),
      notifyTime: DateTime.parse(json['notifyTime']),
      expirationTime: DateTime.parse(json['expirationTime']),
      estimatedArrivalTime: Duration(minutes: json['estimatedArrivalTime']),
      status: stringToStatus(json['status']),
      shiftNumber: json['shiftNumber'],
    );
  }

  static ShiftStatus stringToStatus(String status) {
    switch (status) {
      case 'active':
        return ShiftStatus.active;
      case 'inactive':
        return ShiftStatus.inactive;
      case 'expired':
        return ShiftStatus.expired;
      case 'postponed':
        return ShiftStatus.postponed;
      default:
        return ShiftStatus.error;
    }
  }

  static List<Map<String, dynamic>> listToJson(List<Shift?> shifts) {
    return shifts
        .where((shift) => shift != null)
        .map((shift) => toJson(shift!))
        .toList();
  }

  static List<Shift> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json as Map<String, dynamic>)).toList();
  }
}
