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
  final Duration duration;
  final ItemStatus status;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.duration,
    required this.status,
  });
}
