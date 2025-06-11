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
import 'settingsscreen.dart';
import 'ratescreen.dart';
import 'workshopscreen.dart';
import 'home.dart';
import 'bookedservicescreen.dart';
import 'pendingservicesscreen.dart';
import 'paymentsscreen.dart';
import 'talktousscreen.dart';
import 'signinscreen.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  final List<Widget> _tabs = [
    const HomeTabScreen(),
    const Center(child: Text('Book a Service')),
    const Center(child: Text('Messages')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_arrow,
              progress: _iconAnimationController,
              size: 28,
              color: Colors.white,
            ),
            onPressed: () {
              if (_iconAnimationController.status == AnimationStatus.completed) {
                _iconAnimationController.reverse();
              } else {
                _iconAnimationController.forward();
              }
              Scaffold.of(context).openDrawer();
            },
            tooltip: 'Navigation menu',
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/8806258-Photoroom.png'), 
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome to TechLink!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_online),
              title: const Text('Booked Services'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const BookedServicesScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Payments'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.pending_actions),
              title: const Text('Pending Services'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const PendingServicesScreen()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.star_rate),
              title: const Text('Rate'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const RateScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat_bubble_outline),
              title: const Text('Talk to Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TalkToUsScreen()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.home_repair_service),
              title: const Text('Workshop'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const OpenWorkshopScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    contentPadding: const EdgeInsets.all(20),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/openart-image_5RCWiucX_1748615999611_raw (1)-Photoroom.png', 
                          width: 120,
                          height: 120,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Are you sure you want to log out?',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); 
                          Navigator.pop(context); 

                          

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => SignInScreen()),
                          );
                        },
                        child: const Text('Log Out'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromARGB(255, 211, 22, 244),
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Book'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
