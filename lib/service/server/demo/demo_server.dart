import 'package:todo_turno/model/auth_token_response.dart';
import 'package:todo_turno/model/business.dart';
import 'package:todo_turno/model/item.dart';
import 'package:todo_turno/model/operation.dart';
import 'package:todo_turno/model/payment_info.dart';
import 'package:todo_turno/model/server_settings.dart';
import 'package:todo_turno/model/shift.dart';
import 'package:todo_turno/model/user.dart';
import 'package:todo_turno/service/server/abstract_server_service.dart';

import '../../../util/util.dart';

class DemoServer extends AbstractServerService {
  @override
  Future<Operation> completePaymentProcess(
      Operation operation, AuthTokenResponse token) async {
    await Future.delayed(const Duration(seconds: 2));
    return operation;
  }

  @override
  Future<Business> createBusiness(
      {required String cif,
      required String name,
      required String imageUrl,
      required String phone,
      required String address,
      required String email,
      required AuthTokenResponse token}) async {
    // Simulate a delay of 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Create a Business object with provided data and a dummy ID
    Business business = Business(
      id: 'someGeneratedId',
      // Replace with actual ID generation logic
      cif: cif,
      name: name,
      imageUrl: imageUrl,
      phone: phone,
      address: address,
      email: email,
      createdAt: DateTime.now(),
    );

    return business;
  }

  @override
  Future<Item> createItem(
      {required String name,
      required String description,
      required String imageUrl,
      required ItemStatus itemStatus,
      required AuthTokenResponse token}) async {
    final Item item = Item(
      id: 'DEMO ID',
      name: name,
      description: description,
      imageUrl: imageUrl,
      status: ItemStatus.active
    );
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return item;
  }

  @override
  Future<User> createUser(
      {PaymentInfo? paymentInfo,
      required String name,
        required String nickName,
      required String email,
      required String phoneNumber}) async{
    final User user = User(
      userId: 'UserId DEMO',
      name: name,
      nickName: nickName,
      email: email,
      phoneNumber: phoneNumber,
      paymentInfo: paymentInfo
    );
    await Future.delayed(const Duration(seconds: 2),);
    return user;
  }

  @override
  Future<bool> deleteBusiness(String id, AuthTokenResponse token) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> deleteItem(String id, AuthTokenResponse token) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> deleteShift(
      {required String idItem,
      required String idBusiness,
      required String userId,
      required AuthTokenResponse token}) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> deleteUser(String id, AuthTokenResponse token) async {
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
  Future<Operation> savePaymentProcess(
      Operation operation, AuthTokenResponse token) async {
    await Future.delayed(const Duration(seconds: 1));
    return operation;
  }

  @override
  Future<Business> updateBusiness(
      Business business, AuthTokenResponse token) async {
    await Future.delayed(const Duration(seconds: 1));
    return business;
  }

  @override
  Future<Item> updateItem(
      {required Item item, required AuthTokenResponse token}) async {
    await Future.delayed(const Duration(seconds: 1));
    return item;
  }

  @override
  Future<Operation> updatePaymentProcess(
      Operation operation, AuthTokenResponse token) async {
    await Future.delayed(const Duration(seconds: 1));
    return operation;
  }

  @override
  Future<User> updateUser(User user, AuthTokenResponse token) async {
    await Future.delayed(const Duration(seconds: 1));
    return user;
  }

  @override
  Future<Shift?> creteShift(
      {required String idItem,
      required String idBusiness,
      required AuthTokenResponse token}) async{
    final Shift shift = Util.getSampleShift();
    await Future.delayed(const Duration(seconds: 1),);
    return shift;
  }

  @override
  Future<Shift> updateShift(
      {required String idItem,
      required String idBusiness,
      required AuthTokenResponse token}) async{
    final Shift shift = Util.getSampleShift();
    await Future.delayed(const Duration(seconds: 1),);
    return shift;
  }
}
