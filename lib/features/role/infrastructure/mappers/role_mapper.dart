import '../../../user/domain/entities/user.dart';

class RoleMapper{
  static UserRole _fromJson(Map<String, dynamic> json) {
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

  static List<UserRole> listFromJson(List<dynamic> jsonList){
    return jsonList
        .map((json) => _fromJson(json as Map<String, dynamic>))
        .toList();
  }
}