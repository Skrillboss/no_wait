import 'package:todo_turno/model/auth_token_response.dart';
import 'package:todo_turno/model/business.dart';
import 'package:todo_turno/model/item.dart';
import 'package:todo_turno/model/operation.dart';
import 'package:todo_turno/model/payment_info.dart';
import 'package:todo_turno/model/server_settings.dart';
import 'package:todo_turno/model/shift.dart';
import 'package:todo_turno/model/user.dart';
import 'package:todo_turno/service/server/abstract_server_service.dart';

class DemoServer extends AbstractServerService {
  @override
  Future<Operation> completePaymentProcess(Operation operation, String token) {
    // TODO: implement completePaymentProcess
    throw UnimplementedError();
  }

  @override
  Future<Business> createBusiness(
      {required String cif,
      required String name,
      required String imageUrl,
      required String phone,
      required String address,
      required String email}) {
    // TODO: implement createBusiness
    throw UnimplementedError();
  }

  @override
  Future<Item> createItem(
      {required String name,
      required String description,
      required String imageUrl,
      required ItemStatus itemStatus}) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<User> createUser(
      {PaymentInfo? paymentInfo,
      required String name,
      required String email,
      required String phoneNumber}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Shift?> creteShift(
      {required String idItem,
      required String idBusiness,
      required String userId}) {
    // TODO: implement creteShift
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBusiness(String id, AuthTokenResponse token) async{
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> deleteItem(String id, AuthTokenResponse token) async{
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> deleteShift(
      {required String idItem,
      required String idBusiness,
      required String userId,
      required AuthTokenResponse token}) async{
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> deleteUser(String id, AuthTokenResponse token) async{
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<ServerStatus> getStatus() async {
    await Future.delayed(const Duration(seconds: 1));
    return ServerStatus.ok;
  }

  @override
  Future<AuthTokenResponse> login(String userName, String password) async {
    final AuthTokenResponse authTokenResponse = AuthTokenResponse(
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
      createAt: DateTime.now(),
      expiration: DateTime.now().add(
        const Duration(minutes: 10),
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    return authTokenResponse;
  }

  @override
  Future<Operation> savePaymentProcess(Operation operation, String token) async{
    await Future.delayed(const Duration(seconds: 1));
    return operation;

  }

  @override
  Future<Business> updateBusiness(Business business) async{
    await Future.delayed(const Duration(seconds: 1));
    return business;
  }

  @override
  Future<Item> updateItem({required Item item}) async{
    await Future.delayed(const Duration(seconds: 1));
    return item;
  }

  @override
  Future<Operation> updatePaymentProcess(Operation operation, String token) async{
    await Future.delayed(const Duration(seconds: 1));
    return operation;
  }

  @override
  Future<Shift> updateShift(
      {required String idItem,
      required String idBusiness,
      required String userId}) {
    // TODO: implement updateShift
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(User user) async{
    await Future.delayed(const Duration(seconds: 1));
    return user;
  }
}
