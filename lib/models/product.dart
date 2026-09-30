// Code lớp product: id, name, image, price, discountPercen, description
class Product {
  final String id;
  final String name;
  final String? image;
  final double price;
  final double? discountPercen;
  final String? description;

  Product({
    required this.id,
    required this.name,
    this.image,
    required this.price,
    this.discountPercen,
    this.description,
  });

  Product toCopy({
    String? id,
    String? name,
    String? image,
    double? price,
    double? discountPercen,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      discountPercen: discountPercen ?? this.discountPercen,
      description: description ?? this.description,
    );
  }

  // Chuyển đổi từ JSON sang đối tượng Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: (json['id'] ?? "") as String,
      name: (json['name'] ?? "") as String,
      image: (json['image'] ?? "") as String,
      price: (json['price'] as num).toDouble(),
      discountPercen: json['discountPercen'] != null ? (json['discountPercen'] as num).toDouble() : null,
      description: (json['description'] ?? "") as String,
    );
  }

  // Chuyển đổi từ Product sang đối tượng JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'discountPercen': discountPercen,
      'description': description,
    };
  }
}