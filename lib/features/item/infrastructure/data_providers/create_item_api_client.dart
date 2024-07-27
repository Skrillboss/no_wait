import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_turno/features/item/infrastructure/mappers/item_mapper.dart';
import '../../../business/domain/entities/business.dart';
import '../../../business/infrastructure/mappers/business_mapper.dart';
import '../../domain/entities/item.dart';

class CreateItemApiClient {
  final http.Client httpClient;

  CreateItemApiClient({required this.httpClient});

  Future<Map<String, dynamic>> createItem(Business business, String itemName,
      String description, String imageUrl, ItemStatus status) async {
    final response = await httpClient.post(
      Uri.parse('https://api.example.com/createItem'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'business': BusinessMapper.toJson(business),
        'itemName': itemName,
        'description': description,
        'imageUrl': imageUrl,
        'itemStatus': ItemMapper.statusToString(status), // Convertir el ItemStatus a String
      }),
    );
    await Future.delayed(const Duration(seconds: 1));
    return jsonDecode(response.body);
  }
}
