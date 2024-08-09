import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtTokenManager {
  final _storage = const FlutterSecureStorage();

  /// ***************** JWT TOKEN ******************

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt_token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'jwt_token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'jwt_token');
  }

  /// *************** REFRESH TOKEN ****************

  Future<void> saveRefreshToken(String refreshToken) async{
    await _storage.write(key: 'jwt_refreshToken', value: refreshToken);
  }

  Future<String?> getRefreshToken() async{
    return await _storage.read(key: 'jwt_refreshToken');
  }

  Future<void> deleteRefreshToken() async{
    await _storage.delete(key: 'jwt_refreshToken');
  }
}