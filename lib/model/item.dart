class Item {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
