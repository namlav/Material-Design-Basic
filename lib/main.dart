import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ===== Scaffold =====
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold & FAB Demo'),
      ),

      // Body: nội dung chính của màn hình
      body: const Center(
        child: Text(
          'This is Scaffold body',
          style: TextStyle(fontSize: 22),
        ),
      ),

      // ===== Floating Action Button =====
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Floating Action Button clicked'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
