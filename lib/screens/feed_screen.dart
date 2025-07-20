import 'package:flutter/material.dart';
import '../data/sample_reels.dart';
import '../widgets/reel_card.dart';

class FeedScreen extends StatefulWidget {
  final int initialIndex;

  const FeedScreen({super.key, required this.initialIndex});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: sampleReels.length,
        itemBuilder: (context, index) {
          return ReelCard(reel: sampleReels[index]);
        },
      ),
    );
  }
}
