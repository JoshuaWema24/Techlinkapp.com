
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
import 'profilepicturescreen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _countryController.dispose();
    _phonenumberController.dispose();
    super.dispose();
  }

Future<void> _handleRegister() async {
  final email = _emailController.text.trim();
  final password = _passwordController.text.trim();
  final name = _nameController.text.trim();
  final country = _countryController.text.trim();
  final phone = _phonenumberController.text.trim();

  jsonEncode({
    'name': name,
    'email': email,
    'password': password,
    'country': country,
    'phone': phone,
  });

  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please fill out all fields!', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 180, 9, 210),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 6,
        duration: Duration(seconds: 6),
      ),
    );
    return;
  }

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['success']) {
        // Now login
        final loginResponse = await http.post(
          Uri.parse('http://localhost:3000/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
        );

        final loginData = jsonDecode(loginResponse.body);
        if (loginResponse.statusCode == 200 && loginData['success']) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', loginData['token']);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => ProfilePictureScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(loginData['message'] ?? 'Login failed')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data['message'] ?? 'Registration failed'),
            backgroundColor: const Color.fromARGB(255, 180, 9, 210),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 6,
            duration: Duration(seconds: 6),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e'),
        backgroundColor: const Color.fromARGB(255, 180, 9, 210),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 6,
        duration: Duration(seconds: 6),),
        
      );
    }
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registered as ${account.email}'),
          backgroundColor: const Color.fromARGB(255, 180, 9, 210),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 6,
        duration: Duration(seconds: 6),),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google Sign-In failed: $error'),
        backgroundColor: const Color.fromARGB(255, 180, 9, 210),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 6,
        duration: Duration(seconds: 6),),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.blue),
                  filled: true,
                  fillColor: Colors.blue[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.blue),
                  filled: true,
                  fillColor: Colors.blue[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _countryController,
                decoration: InputDecoration(
                  labelText: 'Country',
                  labelStyle: TextStyle(color: Colors.blue),
                  filled: true,
                  fillColor: Colors.blue[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _phonenumberController,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  labelStyle: TextStyle(color: Colors.blue),
                  filled: true,
                  fillColor: Colors.blue[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.blue),
                  filled: true,
                  fillColor: Colors.blue[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _handleRegister,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Text('or', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 20),
              OutlinedButton.icon(
                icon: Image.asset(
                  'assets/google-icon-isolated-3d-render-illustration.png',
                  height: 24,
                  width: 24,
                ),
                label: Text(
                  'Continue with Google',
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                onPressed: _handleGoogleSignIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


