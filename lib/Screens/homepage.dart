import 'package:flutter/material.dart';
import '../widgets/productWidget.dart';
import '../widgets/inputWidget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu cho danh sách phim (Exercise 3)
    final List<Map<String, String>> movies = [
      {'title': 'Avatar', 'subtitle': 'Sample description', 'letter': 'A'},
      {'title': 'Inception', 'subtitle': 'Sample description', 'letter': 'I'},
      {'title': 'Interstellar', 'subtitle': 'Sample description', 'letter': 'I'},
      {'title': 'Joker', 'subtitle': 'Sample description', 'letter': 'J'},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Exercise 3 - Layout Basics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Áp dụng spacing đồng nhất (16px)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tiêu đề phần Now Playing
            const Text(
              'Now Playing',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12), // Khoảng cách giữa tiêu đề và danh sách

            // Sử dụng ListView.builder để hiển thị danh sách các item
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12), // Khoảng cách giữa các card
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        // Avatar tròn hiển thị chữ cái đầu
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black87,
                          child: Text(movie['letter']!),
                        ),
                        const SizedBox(width: 16), // Khoảng cách giữa Avatar và text
                        // Tiêu đề phim và mô tả
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie['title']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              movie['subtitle']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}