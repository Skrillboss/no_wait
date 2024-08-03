import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_turno/features/business/infrastructure/mappers/business_mapper.dart';
import 'package:todo_turno/features/paymentInfo/infrastructure/mappers/payment_info_mapper.dart';
import '../../../../business/domain/entities/business.dart';
import '../../../../paymentInfo/domain/entities/payment_info.dart';

class RegisterUserApiClient {
  final http.Client httpClient;

  RegisterUserApiClient({required this.httpClient});

  Future<Map<String, dynamic>> registerUser(
    String name,
    String nickName,
    String email,
    String phoneNumber,
    String password,
    PaymentInfo? paymentInfo,
    Business? business,
  ) async {
    final response = await httpClient.post(
      Uri.parse('https://api.example.com/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'nickName': nickName,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
        'paymentInfo': paymentInfo != null ? PaymentInfoMapper.toJson(paymentInfo) : null,
        'business': business != null ? BusinessMapper.toJson(business) : null,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register user');
    }
  }
}
