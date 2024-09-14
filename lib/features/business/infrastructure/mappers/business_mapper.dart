import '../../../item/infrastructure/mappers/item_mapper.dart';
import '../../domain/entities/business.dart';

class BusinessMapper {
  static Business fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['businessId'],
      cif: json['cif'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      phone: json['phone'],
      address: json['address'],
      email: json['email'],
      createdAt: DateTime.parse(json['createdAt']),
      items: json['items'] != null ? ItemMapper.listFromJson(json['items'] as List<dynamic>) : [],
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
      'items': ItemMapper.listToJson(business.items),
    };
  }
}
