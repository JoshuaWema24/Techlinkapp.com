// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'homepage.dart';
class AccountTypeSelectionScreen extends StatelessWidget {
  const AccountTypeSelectionScreen({super.key});

  void _handleSelection(BuildContext context, String accountType) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => LoadingScreen(accountType: accountType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Account Type'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard(context, 'Worker', Icons.build, Colors.orange),
            SizedBox(height: 20),
            _buildCard(context, 'Customer', Icons.person, Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () => _handleSelection(context, title.toLowerCase()),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(width: 20),
              Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
  
  class LoadingScreen extends StatefulWidget {
  final String accountType;

  const LoadingScreen({Key? key, required this.accountType}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 4)); // Simulate loading

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Add a gradient background
          children: [
            Image.asset('assets/loading_image.png', height: 400), // Add your image to assets
            SizedBox(height: 20),
            Text('Loading', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
