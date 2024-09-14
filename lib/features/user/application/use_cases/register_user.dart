import '../../../business/domain/entities/business.dart';
import '../../../paymentInfo/domain/entities/payment_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/register_user_repository.dart';

class RegisterUser {
  final RegisterUserRepository repository;

  RegisterUser(this.repository);

  Future<User> call({
    required String name,
    required String nickName,
    required String email,
    required String phoneNumber,
    required String password,
    required String userRole,
    PaymentInfo? paymentInfo,
    Business? business,
  }) async {
    return await repository.register(
      name: name,
      nickName: nickName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      userRole: userRole,
      paymentInfo: paymentInfo,
      business: business,
    );
  }
}
