import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/product_dao.dart';
import 'product_detail_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ProductDAO _productDAO = ProductDAO();
  late List<Product> _displayProducts;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _displayProducts = _productDAO.getAllProduct();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _displayProducts = _productDAO.findProductByName(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Thanh tìm kiếm (Search Bar)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),

          // Danh sách sản phẩm dạng Grid đáp ứng (Responsive Grid)
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return OrientationBuilder(
                  builder: (context, orientation) {
                    double width = constraints.maxWidth;
                    int crossAxisCount = 1;

                    // Logic tính số cột theo yêu cầu đề bài
                    if (width <= 500) {
                      crossAxisCount = (orientation == Orientation.portrait) ? 1 : 2;
                    } else {
                      crossAxisCount = (orientation == Orientation.portrait) ? 2 : 3;
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(12.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.75, // Tỷ lệ chiều rộng/chiều cao của card
                      ),
                      itemCount: _displayProducts.length,
                      itemBuilder: (context, index) {
                        final product = _displayProducts[index];
                        return GestureDetector(
                          onTap: () {
                            // Chuyển sang màn hình chi tiết khi nhấn vào sản phẩm
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(product: product),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Ảnh sản phẩm
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                                    child: Image.network(
                                      product.image ?? 'https://picsum.photos/400/200',
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.image)),
                                    ),
                                  ),
                                ),
                                // Thông tin tên và giá
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '\$${product.price.toStringAsFixed(2)}',
                                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}