import 'dart:convert';

import 'package:http/http.dart' as http;

class DeleteItemApiClient {
  final http.Client httpClient;

  DeleteItemApiClient({required this.httpClient});

  Future<void> deleteItem(String itemId, String token) async {
    await httpClient.delete(
      Uri.parse('https://api.example.com/deleteItem'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        {
          'itemId': itemId,
        },
      ),
    );
  }
}
