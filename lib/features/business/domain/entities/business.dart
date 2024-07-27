import '../../../item/domain/entities/item.dart';

class Business {
  final String id;
  final String cif;
  final String name;
  final String imageUrl;
  final String phone;
  final String address;
  final String email;
  final DateTime createdAt;
  final Item item;

  Business(
      {required this.id,
        required this.cif,
        required this.name,
        required this.imageUrl,
        required this.phone,
        required this.address,
        required this.email,
        required this.createdAt,
        required this.item
      });
}