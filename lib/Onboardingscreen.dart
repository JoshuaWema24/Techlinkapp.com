 
import 'package:flutter/material.dart';

 class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/2769504-Photoroom.png',
      'title': 'Welcome to Techlink!',
      'subtitle': 'We bring the service\nto your doorstep.',
    },
    {
      'image': 'assets/6534541-Photoroom.png',
      'title': 'We are the Solution to your problem',
      'subtitle': 'Find a technician to fix your issues\nat the comfort of your home',
    },
    {
      'image': 'assets/7358651-Photoroom.png',
      'title': 'Access Anywhere',
      'subtitle': 'Find, pay, and rate your technician\nfrom anywhere, anytime.',
    },
    {
      'image': 'assets/labor-day-celebration-with-portrait-laborer-work (1)-Photoroom.png',
      'title': 'TechLink app',
      'subtitle': 'Make your life easier\nwith the Techlink app',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: (idx) => setState(() => _currentPage = idx),
              itemBuilder: (context, idx) {
                final p = _pages[idx];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            _controller.animateToPage(
                              _pages.length - 1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text('Skip', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              p['image']!,
                              fit: BoxFit.contain,
                              height: 250,
                            ),
                            SizedBox(height: 24),
                            Text(
                              p['title']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              p['subtitle']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white70, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pages.length, (i) {
                  final isActive = i == _currentPage;
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: isActive ? 12 : 8,
                    height: isActive ? 12 : 8,
                    decoration: BoxDecoration(
                      color: isActive ? Colors.white : Colors.white38,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 24,
              right: 24,
              child: _currentPage == _pages.length - 1
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xFF5A9BFF),
                        backgroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/auth');
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    )
                  : FloatingActionButton(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF5A9BFF),
                      onPressed: () => _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                      child: Icon(Icons.arrow_forward),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
