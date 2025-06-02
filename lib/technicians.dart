import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DesignerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DesignerScreen extends StatelessWidget {
  final List<Map<String, dynamic>> designers = [
    {
      "name": "David Borg",
      "title": "Flying wings",
      "color": Color(0xFF89CFF0), // light blue
      "rating": 1,
    },
    {
      "name": "Lucy",
      "title": "Drawing up trouble",
      "color": Color(0xFFFFC078), // light orange
      "rating": 2,
    },
    {
      "name": "Jerry Cool West",
      "title": "Sculptor's diary",
      "color": Color(0xFFFF8A8A), // soft red/pink
      "rating": 3,
    },
    {
      "name": "Bold",
      "title": "Illustration of little girl",
      "color": Color(0xFF9DE4B5), // soft mint green
      "rating": 4,
    },
    {
      "name": "David Borg",
      "title": "",
      "color": Color(0xFF71E2E2), // cyan/light teal
      "rating": 5,
    },
    {
      "name": "David Borg",
      "title": "",
      "color": Color.fromARGB(255, 221, 247, 89), // cyan/light teal
      "rating": 5,
    },
    {
      "name": "Joshua",
      "title": "",
      "color": Color.fromARGB(255, 92, 228, 24), // cyan/light teal
      "rating": 5,
    },
    {
      "name": "Joshua",
      "title": "",
      "color": Color.fromARGB(255, 217, 80, 244), // cyan/light teal
      "rating": 5,
    },
    {
      "name": "Joshua",
      "title": "",
      "color":Color(0xFFFF8A8A), // cyan/light teal
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
            Expanded(
              child: ListView.builder(
                itemCount: designers.length,
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  final designer = designers[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: designer['color'],
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius:60 ,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, size: 30),
                        ),
                        SizedBox(width: 16
                        ),
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
                              Text("Title: ${designer['title']}",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 14)),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Icon(Icons.favorite_border, color: Colors.white),
                            SizedBox(height: 4),
                            Text("${designer['rating']}\nrating",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ],
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
