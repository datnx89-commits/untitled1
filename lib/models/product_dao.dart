import 'product.dart';

class ProductDAO {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'iPhone 15',
      image: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500',
      price: 1099.0,
      discountPercen: 9.0,
      description: 'Experience the latest technology with the new iPhone 15. Stunning design, powerful performance.',
    ),
    Product(
      id: '2',
      name: 'Samsung S24',
      image: 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500', // Ảnh Samsung thực tế, phù hợp
      price: 999.0,
      discountPercen: 10.0,
      description: 'Samsung flagship phone with advanced features, brilliant display and top-tier performance.',
    ),
  ];

  List<Product> getAllProduct() {
    return _products;
  }

  List<Product> findProductByName(String keyword) {
    if (keyword.isEmpty) return _products;
    return _products.where((p) => p.name.toLowerCase().contains(keyword.toLowerCase())).toList();
  }
}