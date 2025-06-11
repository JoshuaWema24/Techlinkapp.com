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
import 'servicesscreen.dart';
import 'Onboardingscreen.dart';
import 'authscreen.dart';
import 'signinscreen.dart';
import 'homepage.dart';
import 'registerscreen.dart';
import 'home.dart';

void main() => runApp(TechlinkApp());

class TechlinkApp extends StatelessWidget {
  const TechlinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Techlink Onboarding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: TechlinkSplash(),
      routes: {
        '/auth': (context) => AuthScreen(),
        '/signin': (context) => SignInScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}


class TechlinkSplash extends StatefulWidget {
  const TechlinkSplash({super.key});

  @override
  _TechlinkSplashState createState() => _TechlinkSplashState();
}

class _TechlinkSplashState extends State<TechlinkSplash> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 8)); // Optional: shorter delay

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      // User is logged in
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } else {
      // No token, show onboarding ??
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/8806258-Photoroom.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Techlink',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Text(
                'By Afribyt',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



























 
