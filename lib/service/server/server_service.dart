import 'package:todo_turno/model/business.dart';
import 'package:todo_turno/model/item.dart';
import 'package:todo_turno/model/operation.dart';
import 'package:todo_turno/model/payment_info.dart';
import 'package:todo_turno/model/user.dart';
import 'package:todo_turno/service/server/abstract_server_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../model/execution_result.dart';
import 'cloud/api_server.dart';
import 'demo/demo_server.dart';

class ServerService {
  static final ServerService _instance = ServerService._internal();

  ServerService._internal();

  static ServerService get instance => _instance;

  AbstractServerService loadAtmServerSettings() {
    if (dotenv.env['SERVER_TYPE']! == 'DEMO') {
      return DemoServer();
    } else if (dotenv.env['SERVER_TYPE']! == 'BACK-END') {
      return ApiServer();
    } else {
      throw Exception('Error no controlado');
    }
  }

  Future<ExecutionResult> performOperation(
      Function(AbstractServerService) operation, String methodName) async {
    ExecutionResult executionResult;
    try {
      var atmServer = loadAtmServerSettings();

      final dynamic data = await operation(atmServer);
      executionResult =
          ExecutionResult(statusCode: 0, message: 'OK', data: data);
    } catch (ex, st) {
      print('ERROR AL EJECUTAR EL METODO $methodName');
      final Exception exception =
          (ex is Exception) ? ex : Exception(ex.toString());
      executionResult = ExecutionResult(
          statusCode: 700,
          message: ex.toString(),
          exception: exception,
          stackTrace: st);
    }
    return executionResult;
  }

  Future<ExecutionResult> completePaymentProcess(
      Operation operation, String token) async {
    return await performOperation(
        (serverService) =>
            serverService.completePaymentProcess(operation, token),
        'completePaymentProcess');
  }

  Future<ExecutionResult> createBusiness(
      {required String cif,
      required String name,
      required String imageUrl,
      required String phone,
      required String address,
      required String email}) async {
    return await performOperation(
        (serverService) => serverService.createBusiness(
            cif: cif,
            name: name,
            imageUrl: imageUrl,
            phone: phone,
            address: address,
            email: email),
        'createBusiness');
  }

  Future<ExecutionResult> createItem(
      {required String name,
      required String description,
      required String imageUrl,
      required ItemStatus itemStatus}) async {
    return await performOperation(
        (serverService) => serverService.createItem(
            name: name,
            description: description,
            imageUrl: imageUrl,
            itemStatus: itemStatus),
        'createItem');
  }

  Future<ExecutionResult> createUser(
      {PaymentInfo? paymentInfo,
      required String name,
      required String email,
      required String phoneNumber}) async {
    return await performOperation(
        (serverService) => serverService.createUser(
            paymentInfo: paymentInfo,
            name: name,
            email: email,
            phoneNumber: phoneNumber),
        'createUser');
  }

  Future<ExecutionResult> creteShift(
      {required String idItem,
      required String idBusiness,
      required String userId}) async {
    return await performOperation(
        (serverService) => serverService.creteShift(
            idItem: idItem, idBusiness: idBusiness, userId: userId),
        'creteShift');
  }

  Future<ExecutionResult> deleteBusiness(String id) async {
    return await performOperation(
        (serverService) => serverService.deleteBusiness(id), 'deleteBusiness');
  }

  Future<ExecutionResult> deleteItem(String id) async {
    return await performOperation(
        (serverService) => serverService.deleteItem(id), 'deleteItem');
  }

  Future<ExecutionResult> deleteShift(
      {required String idItem,
      required String idBusiness,
      required String userId}) async {
    return await performOperation(
        (serverService) => serverService.deleteShift(
            idItem: idItem, idBusiness: idBusiness, userId: userId),
        'deleteShift');
  }

  Future<ExecutionResult> deleteUser(String id) async {
    return await performOperation(
        (serverService) => serverService.deleteUser(id), 'deleteUser');
  }

  Future<ExecutionResult> getStatus() async {
    return await performOperation(
        (serverService) => serverService.getStatus(), 'getStatus');
  }

  Future<ExecutionResult> login(String userName, String password) async {
    return await performOperation(
        (serverService) => serverService.login(userName, password), 'login');
  }

  Future<ExecutionResult> savePaymentProcess(
      Operation operation, String token) async {
    return await performOperation(
        (serverService) => serverService.savePaymentProcess(operation, token),
        'savePaymentProcess');
  }

  Future<ExecutionResult> updateBusiness(Business business) async {
    return await performOperation(
        (serverService) => serverService.updateBusiness(business),
        'updateBusiness');
  }

  Future<ExecutionResult> updateItem({required Item item}) async {
    return await performOperation(
        (serverService) => serverService.updateItem(item: item), 'updateItem');
  }

  Future<ExecutionResult> updatePaymentProcess(
      Operation operation, String token) async {
    return await performOperation(
        (serverService) => serverService.updatePaymentProcess(operation, token),
        'updatePaymentProcess');
  }

  Future<ExecutionResult> updateShift(
      {required String idItem,
      required String idBusiness,
      required String userId}) async {
    return await performOperation(
        (serverService) => serverService.updateShift(
            idItem: idItem, idBusiness: idBusiness, userId: userId),
        'updateShift');
  }

  Future<ExecutionResult> updateUser(User user) async {
    return await performOperation(
        (serverService) => serverService.updateUser(user), 'updateUser');
  }
}
