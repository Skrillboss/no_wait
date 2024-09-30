abstract class AuthUserClientRepository{
  Future<Map<String, dynamic>> login(String username, String password);
}