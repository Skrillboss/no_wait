import 'dart:convert';
import 'package:todo_turno/core/custom_exception/custom_exception.dart';
import 'package:todo_turno/core/request_handler_service/request_handler.dart';
import 'package:todo_turno/features/business/infrastructure/mappers/business_mapper.dart';
import 'package:todo_turno/features/paymentInfo/infrastructure/mappers/payment_info_mapper.dart';
import '../../../../business/domain/entities/business.dart';
import '../../../../paymentInfo/domain/entities/payment_info.dart';

class RegisterUserApiClient {
  final RequestHandler requestHandler = RequestHandler();

  Future<Map<String, dynamic>> registerUser(
    String name,
    String nickName,
    String email,
    String phoneNumber,
    String password,
    PaymentInfo? paymentInfo,
    Business? business,
  ) async {
    try{
      final response = await requestHandler.postRequest(
          endPoint: '/register',
          dataDecode: {
            'name': name,
            'nickName': nickName,
            'email': email,
            'phoneNumber': phoneNumber,
            'password': password,
            'paymentInfo': paymentInfo != null ? PaymentInfoMapper.toJson(paymentInfo) : null,
            'business': business != null ? BusinessMapper.toJson(business) : null,
          },
          errorCode: 2000
      );
      return jsonDecode(response.body);
    } on CustomException{
      rethrow;
    }
  }
}
