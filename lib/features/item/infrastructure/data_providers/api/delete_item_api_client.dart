import 'dart:convert';

import 'package:http/http.dart' as http;

class DeleteItemApiClient {
  final http.Client httpClient;

  DeleteItemApiClient({required this.httpClient});

  //TODO: Delete the String token parameter, for that, I have to add a new requestHandler with the delete petition
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
