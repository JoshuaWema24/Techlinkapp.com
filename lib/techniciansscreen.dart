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

class TechniciansScreen extends StatelessWidget {
  final List<Map<String, dynamic>> designers = [
    {
      "name": "David Borg",
      "jobtype": "Mobile app developer",
      "color": Color.fromARGB(255, 122, 198, 234),
      "rating": 1,
    },
    {
      "name": "Lucy",
      "jobtype": "Mobile app developer",
      "color": Color(0xFFFFC078),
      "rating": 2,
    },
    {
      "name": "Jerry Cool West",
      "jobtype": "Mobile app developer",
      "color": Color(0xFFFF8A8A),
      "rating": 3,
    },
    {
      "name": "Bold",
      "jobtype": "Mobile app developer",
      "color": Color(0xFF9DE4B5),
      "rating": 4,
    },
    {
      "name": "David Borg",
      "jobtype": "Mobile app developer",
      "color": Color(0xFF71E2E2),
      "rating": 5,
    },
    {
      "name": "David Borg",
      "jobtype": "Mobile app developer",
      "color": Color.fromARGB(255, 221, 247, 89),
      "rating": 5,
    },
    {
      "name": "Joshua",
      "jobtype": "Mobile app developer",
      "color": Color.fromARGB(255, 92, 228, 24),
      "rating": 5,
    },
    {
      "name": "Joshua",
      "jobtype": "Mobile app developer",
      "color": Color.fromARGB(255, 217, 80, 244),
      "rating": 5,
    },
    {
      "name": "Joshua",
      "jobtype": "Mobile app developer",
      "color": Color(0xFFFF8A8A),
      "rating": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search technician...",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color(0xFFF0F0F0),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // List of cards
            Expanded(
              child: ListView.builder(
                itemCount: designers.length,
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  final designer = designers[index];
                  final String jobType = designer['jobtype'] ?? '';
                  final int rating = designer['rating'] ?? 0;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfileScreen7(technician: designer),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: designer['color'],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, size: 30),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(designer['name'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                if (jobType.isNotEmpty)
                                  Text(jobType,
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 14)),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: List.generate(5, (i) {
                                  return Icon(
                                    i < rating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.white,
                                    size: 16,
                                  );
                                }),
                              ),
                              SizedBox(height: 4),
                              Text("$rating\nrating",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileScreen7 extends StatelessWidget {
  final Map<String, dynamic> technician;

  const ProfileScreen7({Key? key, required this.technician}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String name = technician['name'];
    final String jobType = technician['jobtype'];
    final int rating = technician['rating'];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, child: Icon(Icons.person, size: 40)),
            SizedBox(height: 16),
            Text(name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(jobType, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                return Icon(
                  i < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}