import '../../../user/domain/entities/user.dart';

class RoleMapper{
  static UserRole fromJson(Map<String, dynamic> json) {
    final roleName = json['name'] as String;

    switch (roleName) {
      case 'ADMIN':
        return UserRole.ADMIN;
      case 'MANAGER':
        return UserRole.MANAGER;
      case 'USER':
        return UserRole.USER;
      default:
        throw Exception('Unknown role: $roleName');
    }
  }
}