import 'package:todo_turno/features/business/domain/entities/business.dart';
import 'package:todo_turno/features/paymentInfo/domain/entities/payment_info.dart';
import 'package:todo_turno/features/user/domain/entities/user.dart';
import '../../domain/repositories/register_user_repository.dart';
import '../data_providers/api/register_user_api_client.dart';
import '../mappers/user_mapper.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  final RegisterUserApiClient apiClient;

  RegisterUserRepositoryImpl({required this.apiClient});

  @override
  Future<User> register(
      {required String name,
      required String nickName,
      required String email,
      required String phoneNumber,
      required String password,
      PaymentInfo? paymentInfo,
      Business? business}) async {
    final Map<String, dynamic> data = await apiClient.registerUser(
        name, nickName, email, phoneNumber, password, paymentInfo, business);
    final User user = UserMapper.fromJson(data);
    return user;
  }
}
