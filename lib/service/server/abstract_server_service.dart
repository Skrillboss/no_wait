import '../../model/auth_token_response.dart';
import '../../model/business.dart';
import '../../model/item.dart';
import '../../model/operation.dart';
import '../../model/payment_info.dart';
import '../../model/server_settings.dart';
import '../../model/shift.dart';
import '../../model/user.dart';

abstract class AbstractServerService {
  Future<ServerStatus> getStatus();

  Future<AuthTokenResponse> login(String userName, String password);

  Future<Shift?> creteShift(
      {required String idItem,
      required String idBusiness,
      required String userId});

  Future<Shift> updateShift(
      {required String idItem,
      required String idBusiness,
      required String userId});

  Future<void> deleteShift(
      {required String idItem,
      required String idBusiness,
      required String userId});

  Future<User> createUser(
      {PaymentInfo? paymentInfo,
      required String name,
      required String email,
      required String phoneNumber});

  Future<User> updateUser(User user);

  Future<void> deleteUser(String id);

  Future<Business> createBusiness(
      {required String cif,
      required String name,
      required String imageUrl,
      required String phone,
      required String address,
      required String email});

  Future<Business> updateBusiness(Business business);

  Future<void> deleteBusiness(String id);

  Future<Item> createItem(
      {required String name,
      required String description,
      required String imageUrl,
      required ItemStatus itemStatus});

  Future<Item> updateItem({required Item item});

  Future<void> deleteItem(String id);

  Future<Operation> savePaymentProcess(Operation operation, String token);

  Future<Operation> updatePaymentProcess(Operation operation, String token);

  Future<Operation> completePaymentProcess(Operation operation, String token);
}
