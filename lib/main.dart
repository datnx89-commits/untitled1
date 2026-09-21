import 'package:flutter/material.dart';
import 'Screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Exercise 5: Applying ThemeData
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4 Flutter UI Fundamentals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(), // Gọi màn hình chính ở đây
    );
  }
}