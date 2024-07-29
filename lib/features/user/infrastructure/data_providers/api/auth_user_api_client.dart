import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthUserApiClient {
  final http.Client httpClient;

  AuthUserApiClient({required this.httpClient});

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await httpClient.post(
      Uri.parse('https://api.example.com/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
      return jsonDecode(response.body);
  }
}
