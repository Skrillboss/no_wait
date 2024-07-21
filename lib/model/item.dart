enum ItemStatus{
  active,
  inactive,
  suspended,
  noStock,
  unhandledError
}

class Item {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final ItemStatus status;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.status,
  });


  //TODO: SE DEBE MANEJAR LA ENTREGA DEL STATUS
  //DE STRING A ItemStatus
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      status: json['status']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': name,
      'description': description,
      'imageUrl': imageUrl,
      'status': status
    };
  }
}
