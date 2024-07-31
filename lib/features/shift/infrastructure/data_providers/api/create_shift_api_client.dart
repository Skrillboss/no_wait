import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateShiftApiClient{
  final http.Client httpClient;

  CreateShiftApiClient({required this.httpClient});

  Future<Map<String, dynamic>> createShift(String userId, String itemId, String token) async {
    final response = await httpClient.post(
      Uri.parse('https://api.example.com/creteShift'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'userId': userId,
        'itemId': itemId
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load item');
    }
  }
}