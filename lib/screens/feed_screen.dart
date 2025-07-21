import 'package:flutter/material.dart';
import '../models/reel.dart';
import '../widgets/reel_card.dart';

class FeedScreen extends StatefulWidget {
  final int initialIndex;
  final List<Reel> reels;

  const FeedScreen({
    super.key,
    required this.initialIndex,
    required this.reels,
  });

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
        itemCount: widget.reels.length,
        itemBuilder: (context, index) {
          return ReelCard(reel: widget.reels[index]);
        },
      ),
    );
  }
}
