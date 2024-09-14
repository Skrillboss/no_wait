import 'package:todo_turno/features/paymentInfo/domain/entities/payment_info.dart';
import '../../../business/domain/entities/business.dart';
import '../../../shift/domain/entities/shift.dart';

enum UserRole{
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
  PaymentInfo? paymentInfo;
  Business? business;
  List<Shift?> shifts;
  UserRole userRole;

  User({
    required this.userId,
    required this.name,
    required this.nickName,
    required this.email,
    required this.phoneNumber,
    required this.paymentInfo,
    required this.business,
    required this.shifts,
    required this.userRole
  });
}
