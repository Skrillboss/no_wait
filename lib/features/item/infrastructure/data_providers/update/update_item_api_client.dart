import 'dart:convert';
import 'package:todo_turno/features/item/infrastructure/mappers/item_mapper.dart';
import '../../../domain/entities/item.dart';
import 'package:http/http.dart' as http;

class UpdateItemApiClient {
  final http.Client httpClient;

  UpdateItemApiClient({required this.httpClient});
  
  Future<Map<String, dynamic>> updateItem(Item item, String token) async {
    final response = await httpClient.post(
      Uri.parse('https://api.example.com/createItem'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'item': ItemMapper.toJson(item)
      }),
    );
    await Future.delayed(const Duration(seconds: 1));
    return jsonDecode(response.body);
  }
}
