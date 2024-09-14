import 'package:todo_turno/features/paymentInfo/domain/entities/payment_info.dart';
import '../../../business/domain/entities/business.dart';
import '../../../shift/domain/entities/shift.dart';

enum UserRole {
  ADMIN,
  MANAGER,
  REGULAR_USER,
}

class User {
  final String userId;
  String name;
  String nickName;
  String email;
  String phoneNumber;
  List<PaymentInfo?> paymentInfoList;
  Business? business;
  List<Shift?> shiftList;
  UserRole userRole;

  User(
      {required this.userId,
      required this.name,
      required this.nickName,
      required this.email,
      required this.phoneNumber,
      required this.paymentInfoList,
      required this.business,
      required this.shiftList,
      required this.userRole})
      : assert(
            (userRole != UserRole.ADMIN ||
                (paymentInfoList.isNotEmpty && business != null)),
            'For ADMIN role, PaymentInfo and Business are required');
}
