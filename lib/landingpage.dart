// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';


class Landingpage extends StatefulWidget {
  @override
  _landingpageState createState() => _landingpageState();
}

class _landingpageState extends State<Landingpage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Trending services', trendingservices),
            _buildSection('trending technicians', trendingtechnicians),
             _buildSection('trending innovations', trendinginnovations),
          ],
        ),
      ),
    );
  }

  final List<Map<String, String>> trendingservices = [
    {
     'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
    {
      'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
    {
     'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
    {
      'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
    {
     'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
    {
      'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
    {
     'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
    {
      'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
    {
     'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
    {
      'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
    {
     'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
    {
      'image': 'assets/fortnite.png',
      'title': 'Mobile app development',
      'description': 'Best android and IOS apps for you...',
    },
  ];

  final List<Map<String, String>> trendingtechnicians = [
    {
      'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
       'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
     'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
       'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
       'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    {
       'image': 'assets/newgame1.png',
      'title': 'technician',
      'description': 'top ranked technicians...',
    },
    
  ];
 final List<Map<String, String>> trendinginnovations = [
    {
      'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
       'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
       'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
       'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
       'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
       'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
       'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
      'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    {
       'image': 'assets/newgame1.png',
      'title': 'video',
      'description': 'Exciting new release...',
    },
    
  ];

  Widget _buildSection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: items.length,
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = items[index];
              return SizedBox(
                width: 140,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['title']!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item['description']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }


}