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

    PaymentInfo? paymentInfo,
    Business? business,
  }) async {
    return await repository.register(
      name: name,
      nickName: nickName,
      email: email,
      phoneNumber: phoneNumber,
      paymentInfo: paymentInfo,
      business: business,
    );
  }
}
