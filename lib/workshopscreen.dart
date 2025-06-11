import 'package:flutter/material.dart';
class OpenWorkshopScreen extends StatelessWidget {
  const OpenWorkshopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'This is your workshop screen!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
