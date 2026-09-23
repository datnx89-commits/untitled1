import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headline Text (Exercise 1)
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Material Icon (Exercise 1)
            const Center(
              child: Icon(Icons.movie_creation, size: 60, color: Colors.blue),
            ),
            const SizedBox(height: 8),
            // Image.network (Exercise 1)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/400/200',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            // Card containing a ListTile (Exercise 1)
            Card(
              color: Colors.grey.shade100,
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text('Movie Item'),
                subtitle: Text('This is a sample ListTile inside a Card.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}