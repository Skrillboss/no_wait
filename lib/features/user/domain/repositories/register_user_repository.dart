import '../../../business/domain/entities/business.dart';
import '../../../paymentInfo/domain/entities/payment_info.dart';
import '../entities/user.dart';

abstract class RegisterUserRepository {
  Future<User> register({
    required String name,
    required String nickName,
    required String email,
    required String phoneNumber,
    PaymentInfo? paymentInfo,
    Business? business,
  });
}
