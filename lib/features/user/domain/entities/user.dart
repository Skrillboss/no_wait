import 'package:todo_turno/features/paymentInfo/domain/entities/payment_info.dart';
import '../../../business/domain/entities/business.dart';
import '../../../shift/domain/entities/shift.dart';

enum UserRole {
  ADMIN,
  MANAGER,
  USER,
}

class User {
  String name;
  String nickName;
  String email;
  String phoneNumber;
  List<UserRole> roleList;
  List<PaymentInfo?> paymentInfoList;
  Business? business;
  List<Shift?> shiftList;

  User({
    required this.name,
    required this.nickName,
    required this.email,
    required this.phoneNumber,
    required this.roleList,
    required this.paymentInfoList,
    required this.business,
    required this.shiftList,
  }) : assert(
          _validateUser(roleList, paymentInfoList, business),
          'For ADMIN role, PaymentInfo and Business are required',
        );

  static bool _validateUser(List<UserRole> roleList,
      List<PaymentInfo?> paymentInfoList, Business? business) {
    bool isAdmin = roleList.contains(UserRole.ADMIN);
    if (isAdmin) {
      return paymentInfoList.isNotEmpty && business != null;
    }
    return true;
  }
}
