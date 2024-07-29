import 'dart:convert';
import 'package:http/http.dart' as http;

class ReadItemApiClient {
  final http.Client httpClient;

  ReadItemApiClient({required this.httpClient});

  Future<Map<String, dynamic>> getItem(String itemId, String token) async {
    final response = await httpClient.get(
      Uri.parse('https://api.example.com/items/$itemId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load item');
    }
  }
}
