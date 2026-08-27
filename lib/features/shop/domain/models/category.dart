class Category {
  final String id;
  final String name;
  final int itemCount;
  final String imageUrl;

  const Category({
    required this.id,
    required this.name,
    required this.itemCount,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      itemCount: json['itemCount'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'itemCount': itemCount,
      'imageUrl': imageUrl,
    };
  }
}
