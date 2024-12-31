import 'package:todo_turno/features/shift/infrastructure/mappers/shift_mapper.dart';
import '../../../business/infrastructure/mappers/business_mapper.dart';
import '../../../paymentInfo/infrastructure/mappers/payment_info_mapper.dart';
import '../../../role/infrastructure/mappers/role_mapper.dart';
import '../../domain/entities/user.dart';

class UserMapper {
  static User fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      nickName: json['nickName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: RoleMapper.fromJson(json['roleDTO']),
      paymentInfoList: json['paymentInfoResponseDTOList'] != null
          ? PaymentInfoMapper.listFromJson(
              json['paymentInfoResponseDTOList'] as List<dynamic>)
          : [],
      business: json['business'] != null
          ? BusinessMapper.fromJson(json['business'])
          : null,
      shiftList: json['shifts'] != null
          ? ShiftMapper.listFromJson(
              json['shifts'] as List<dynamic>)
          : []
    );
  }

  static Map<String, dynamic> toJson(User user) {
    return {
      'name': user.name,
      'nickName': user.nickName,
      'email': user.email,
      'phoneNumber': user.phoneNumber,
      'paymentInfoList': user.paymentInfoList.isNotEmpty
          ? PaymentInfoMapper.listToJson(user.paymentInfoList)
          : null,
      'shifts':
          user.shiftList.isNotEmpty ? ShiftMapper.listToJson(user.shiftList) : null,
    };
  }
}
