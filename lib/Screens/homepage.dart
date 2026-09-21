import 'package:flutter/material.dart';
import '../widgets/productWidget.dart';
import '../widgets/inputWidget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Exercise 4 & 5: Building Screen Structure using Scaffold & ThemeData
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 - Flutter UI Fundamentals Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // Exercise 3: Layout Composition using ListView, Column, Row, Padding
        child: ListView(
          children: [
            const Text(
              'Exercise 1: Core Widgets (Card, Image, Text)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Hiển thị widget sản phẩm của Exercise 1
            const Center(child: productWidget()),
            const Divider(height: 40, thickness: 2),

            const Text(
              'Exercise 2: Input Controls (Slider, Switch, Radio)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Nút chuyển hướng sang màn hình Input Controls của Exercise 2
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const inputWidget()),
                );
              },
              child: const Text('Mở bài tập Input Controls (Exercise 2)'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}