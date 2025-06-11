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

class servicesscreen extends StatefulWidget {
  @override
  _servicesscreenState createState() => _servicesscreenState();
}

class _servicesscreenState extends State<servicesscreen> {
  String selectedTab = 'Technology';

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Graphic Design',
      'courses': '10 designers',
      'color': Colors.blueAccent,
      'icon': Icons.design_services,
    },
    {
      'title': 'Mobile app development',
      'courses': '10 developers',
      'color': Colors.redAccent,
      'icon': Icons.code,
    },
    {
      'title': 'web designers',
      'courses': '10 developers',
      'color': Colors.orangeAccent,
      'icon': Icons.attach_money,
    },
    {
      'title': 'UI/UX design',
      'courses': 'Designers',
      'color': Colors.purpleAccent,
      'icon': Icons.phone_android,
    },
     {
      'title': 'UI/UX design',
      'courses': 'Designers',
      'color': const Color.fromARGB(255, 251, 195, 64),
      'icon': Icons.phone_android,
    },
     {
      'title': 'UI/UX design',
      'courses': 'Designers',
      'color': const Color.fromARGB(255, 251, 64, 64),
      'icon': Icons.phone_android,
    },
     {
      'title': 'UI/UX design',
      'courses': 'Designers',
      'color': Colors.purpleAccent,
      'icon': Icons.phone_android,
    },
    {
      'title': 'UI/UX design',
      'courses': 'Designers',
      'color': const Color.fromARGB(255, 64, 229, 251),
      'icon': Icons.phone_android,
    },
    {
      'title': 'UI/UX design',
      'courses': 'Designers',
      'color': const Color.fromARGB(255, 64, 117, 251),
      'icon': Icons.phone_android,
    },
    {
      'title': 'UI/UX design',
      'courses': 'Designers',
      'color': const Color.fromARGB(255, 195, 251, 64),
      'icon': Icons.phone_android,
    },
    {
      'title': 'UI/UX design',
      'courses': 'Designers',
      'color': const Color.fromARGB(255, 251, 64, 64),
      'icon': Icons.phone_android,
    },
    {
      'title': 'UI/UX design',
      'courses': 'Designers',
      'color': const Color.fromARGB(255, 251, 201, 64),
      'icon': Icons.phone_android,
    },
  ]; // <-- Close the categories list properly

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF1FC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Row: Greeting & Avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi Joshua 👋',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      SizedBox(height: 4),
                      Text('Today is a good day to learn about our services!',
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey[700])),
                    ],
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                ],
              ),
              SizedBox(height: 30),

              /// Tabs
              Row(
                children: [
                  _buildTab('Technology', selectedTab == 'Technology', () {
                    setState(() {
                      selectedTab = 'Technology';
                    });
                  }),
                  SizedBox(width: 12),
                  _buildTab('Agriculture', selectedTab == 'Agriculture', () {
                    setState(() {
                      selectedTab = 'Agriculture';
                    });
                  }),
                  SizedBox(width: 12),
                  _buildTab('Electricity', selectedTab == 'Electricity', () {
                    setState(() {
                      selectedTab = 'Electricity';
                    });
                  }),
                  Spacer(),
                  Text('See all',
                      style: TextStyle(color: Colors.blue, fontSize: 14)),
                ],
              ),
              SizedBox(height: 20),

              /// Grid of Cards
              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2.6,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return _AnimatedCard(
                      title: item['title'],
                      subtitle: item['courses'],
                      color: item['color'],
                      icon: item['icon'],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => serviceinfo(
                              category: item['title'],
                              courseCount: item['courses'],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, bool isActive, [VoidCallback? onTap]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.pink[100] : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.pink : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _AnimatedCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  const _AnimatedCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<_AnimatedCard> {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 0.95);
  void _onTapUp(_) => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => setState(() => _scale = 1.0),
      onTap: widget.onTap,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: _scale),
        duration: Duration(milliseconds: 100),
        builder: (context, value, child) => Transform.scale(
          scale: value,
          child: child,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(widget.icon, color: Colors.white, size: 32),
              Spacer(),
              Text(widget.title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 4),
              Text(widget.subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}



class serviceinfo extends StatelessWidget {
  final String category;
  final String courseCount;

  serviceinfo({required this.category, required this.courseCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Text(
          '$category has $courseCount',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
