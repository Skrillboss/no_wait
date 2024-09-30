import '../../../item/domain/entities/item.dart';

class Business {
  final String id;
  String cif;
  String name;
  String imageUrl;
  String phone;
  String address;
  final String email;
  final DateTime createdAt;
  List<Item?> itemList;

  Business(
      {required this.id,
        required this.cif,
        required this.name,
        required this.imageUrl,
        required this.phone,
        required this.address,
        required this.email,
        required this.createdAt,
        required this.itemList
      });
}
