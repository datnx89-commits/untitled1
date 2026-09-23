import 'package:flutter/material.dart';
import '../widgets/productWidget.dart';
import '../widgets/inputWidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lab 4 – Flutter UI Fundamentals'),
          actions: [
            Row(
              children: [
                const Text('Dark', style: TextStyle(fontSize: 14)),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Complete Lab 4 Workflow',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              const Text(
                'Exercise 3: Now Playing List (ListView)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blueGrey),
              ),
              const SizedBox(height: 8),

              SizedBox(
                height: 280,
                child: ListView(
                  children: const [
                    MovieCardItem(title: 'Avatar', subtitle: 'Sample description', letter: 'A'),
                    MovieCardItem(title: 'Inception', subtitle: 'Sample description', letter: 'I'),
                    MovieCardItem(title: 'Interstellar', subtitle: 'Sample description', letter: 'I'),
                    MovieCardItem(title: 'Joker', subtitle: 'Sample description', letter: 'J'),
                  ],
                ),
              ),
              const Divider(height: 32),

              const Text(
                'Exercise 1: Core Widgets Demo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blueGrey),
              ),
              const SizedBox(height: 8),
              const ProductWidget(),
              const Divider(height: 32),

              const Text(
                'Exercise 2: Input Controls Demo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blueGrey),
              ),
              const SizedBox(height: 8),
              const InputWidget(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Floating Action Button clicked successfully!')),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MovieCardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String letter;

  const MovieCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.letter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Text(letter, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
  }
}