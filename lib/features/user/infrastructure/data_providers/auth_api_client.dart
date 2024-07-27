import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApiClient {
  final http.Client httpClient;

  AuthApiClient({required this.httpClient});

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await httpClient.post(
      Uri.parse('https://api.example.com/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    await Future.delayed(const Duration(seconds: 1));
      return jsonDecode(response.body);
  }
}
