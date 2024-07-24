import 'package:todo_turno/model/auth_token_response.dart';
import 'package:todo_turno/model/business.dart';
import 'package:todo_turno/model/item.dart';
import 'package:todo_turno/model/operation.dart';
import 'package:todo_turno/model/payment_info.dart';
import 'package:todo_turno/model/server_settings.dart';
import 'package:todo_turno/model/shift.dart';
import 'package:todo_turno/model/user.dart';
import 'package:todo_turno/service/server/abstract_server_service.dart';

class ApiServer extends AbstractServerService {
  @override
  Future<bool> deleteBusiness(String id, AuthTokenResponse token) {
    // TODO: implement deleteBusiness
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteItem(String id, AuthTokenResponse token) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteShift(
      {required String idItem,
      required String idBusiness,
      required String userId,
      required AuthTokenResponse token}) {
    // TODO: implement deleteShift
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteUser(String id, AuthTokenResponse token) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<ServerStatus> getStatus() {
    // TODO: implement getStatus
    throw UnimplementedError();
  }

  @override
  Future<AuthTokenResponse> login(String userName, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Operation> savePaymentProcess(
      Operation operation, AuthTokenResponse token) {
    // TODO: implement savePaymentProcess
    throw UnimplementedError();
  }

  @override
  Future<Business> updateBusiness(Business business, AuthTokenResponse token) {
    // TODO: implement updateBusiness
    throw UnimplementedError();
  }

  @override
  Future<Operation> completePaymentProcess(
      Operation operation, AuthTokenResponse token) {
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
      required String email,
      required AuthTokenResponse token}) {
    // TODO: implement createBusiness
    throw UnimplementedError();
  }

  @override
  Future<Item> createItem(
      {required String name,
      required String description,
      required String imageUrl,
      required ItemStatus itemStatus,
      required AuthTokenResponse token}) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<User> createUser(
      {PaymentInfo? paymentInfo,
      required String name,
      required String nickName,
      required String email,
      required String phoneNumber}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Shift?> creteShift(
      {required String idItem,
      required String idBusiness,
      required AuthTokenResponse token}) {
    // TODO: implement creteShift
    throw UnimplementedError();
  }

  @override
  Future<Item> updateItem(
      {required Item item, required AuthTokenResponse token}) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  Future<Operation> updatePaymentProcess(
      Operation operation, AuthTokenResponse token) {
    // TODO: implement updatePaymentProcess
    throw UnimplementedError();
  }

  @override
  Future<Shift> updateShift(
      {required String idItem,
      required String idBusiness,
      required AuthTokenResponse token}) {
    // TODO: implement updateShift
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(User user, AuthTokenResponse token) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
