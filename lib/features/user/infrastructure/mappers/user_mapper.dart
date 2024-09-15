import 'package:todo_turno/features/shift/infrastructure/mappers/shift_mapper.dart';
import '../../../business/infrastructure/mappers/business_mapper.dart';
import '../../../paymentInfo/infrastructure/mappers/payment_info_mapper.dart';
import '../../domain/entities/user.dart';

class UserMapper {
  static User fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      name: json['name'],
      nickName: json['nickName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      paymentInfoList: json['paymentInfoList'] != null
          ? PaymentInfoMapper.listFromJson(
              json['paymentInfoList'] as List<dynamic>)
          : [],
      business: json['business'] != null
          ? BusinessMapper.fromJson(json['business'])
          : null,
      shiftList: json['shifts'] != null
          ? ShiftMapper.listFromJson(
              json['shifts'] as List<dynamic>)
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
      'paymentInfoList': user.paymentInfoList.isNotEmpty
          ? PaymentInfoMapper.listToJson(user.paymentInfoList)
          : null,
      'shifts':
          user.shiftList.isNotEmpty ? ShiftMapper.listToJson(user.shiftList) : null,
      'userRole': user.userRole.toString().split('.').last
    };
  }
}
