import '../../domain/entities/business.dart';

class BusinessMapper {
  static Business fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      cif: json['cif'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      phone: json['phone'],
      address: json['address'],
      email: json['email'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  static Map<String, dynamic> toJson(Business business) {
    return {
      'id': business.id,
      'cif': business.cif,
      'name': business.name,
      'imageUrl': business.imageUrl,
      'phone': business.phone,
      'address': business.address,
      'email': business.email,
      'createdAt': business.createdAt.toIso8601String(),
    };
  }
}
