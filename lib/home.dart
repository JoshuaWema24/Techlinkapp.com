// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techlink_v2/updatesscreen.dart';
import 'dart:io';
import 'servicesscreen.dart';
import 'techniciansscreen.dart';
import 'landingpage.dart';


class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
      appBar: AppBar(
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Color.fromARGB(255, 208, 18, 241)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  bottom: const TabBar(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white70,
    labelStyle: TextStyle(
      fontSize: 16, 
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14, 
    ),
    tabs: [
      Tab(text: 'Techlink'),
      Tab(text: 'Updates'),
      Tab(text: 'Services'),
      Tab(text: 'Technicians'),
    ],
  ),
),

        body: TabBarView(
          children: [
            Center(child: Landingpage()),
            Center(child: TechNewsScreen()),
            Center(child: servicesscreen()),
            TechniciansScreen(),
          ],
        ),
      ),
    );
  }
}