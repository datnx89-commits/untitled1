import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hiển thị ảnh sản phẩm trọn vẹn bằng BoxFit.contain
            Center(
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.image ?? 'https://picsum.photos/400/200',
                    fit: BoxFit.contain, // Không bị cắt hình, hiện đầy đủ
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 100),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tên sản phẩm
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Giá và phần trăm giảm giá
            Row(
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                ),
                if (product.discountPercen != null && product.discountPercen! > 0) ...[
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '-${product.discountPercen}%',
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ],
            ),
            const Divider(height: 32),

            // Tiêu đề mô tả
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Nội dung mô tả
            Text(
              product.description ?? 'No description available.',
              style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}