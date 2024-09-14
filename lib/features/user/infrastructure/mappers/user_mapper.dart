import 'package:todo_turno/features/shift/infrastructure/mappers/shift_mapper.dart';
import '../../../business/infrastructure/mappers/business_mapper.dart';
import '../../../paymentInfo/infrastructure/mappers/payment_info_mapper.dart';
import '../../domain/entities/user.dart';

class UserMapper {
  static User fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      name: json['name'],
      nickName: json['nickName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      paymentInfo: json['paymentInfo'] != null
          ? PaymentInfoMapper.fromJson(json['paymentInfo'])
          : null,
      business: json['business'] != null
          ? BusinessMapper.fromJson(json['business'])
          : null,
      shifts: json['shifts'] != null
          ? ShiftMapper.listFromJson(json['shifts'] as List<dynamic>)
          : [],
      userRole: UserRole.values
          .firstWhere((e) => e.toString().split('.').last == json['userRole']),
    );
  }

  static Map<String, dynamic> toJson(User user) {
    return {
      'userId': user.userId,
      'name': user.name,
      'nickName': user.nickName,
      'email': user.email,
      'phoneNumber': user.phoneNumber,
      'paymentInfo': user.paymentInfo != null
          ? PaymentInfoMapper.toJson(user.paymentInfo!)
          : null,
      'shifts': ShiftMapper.listToJson(user.shifts),
      'userRole': user.userRole.toString().split('.').last
    };
  }
}
