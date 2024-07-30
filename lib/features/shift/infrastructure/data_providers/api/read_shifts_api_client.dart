import 'dart:convert';

import 'package:http/http.dart' as http;

class ReadShiftsApiClient{
  final http.Client httpClient;

  ReadShiftsApiClient({required this.httpClient});

  Future<Map<String, dynamic>> getShifts(String userId, String token) async {
    final response = await httpClient.get(
      Uri.parse('https://api.example.com/shifts/$userId'),
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