import 'package:flutter/material.dart';
import '../models/reel.dart';
import '../navigation/bottom_nav_bar.dart';
import 'feed_screen.dart';
import 'explore_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Reel> reels;

  const HomeScreen({super.key, required this.reels});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      FeedScreen(initialIndex: 0, reels: widget.reels),
      const ExploreScreen(), // ✅ Fixed: removed invalid `reels:` argument
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
