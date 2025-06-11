import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/3d-illustration-handyman-with-tools-his-workshop-Photoroom.png', height: 350),
              SizedBox(height: 20),
              Text('Techlink',
                  style: TextStyle(
                      fontFamily: GoogleFonts.caveat().fontFamily,
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w900)),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () => Navigator.pushNamed(context, '/signin'),
                child: Text('Login', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                child: Text('Register',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}