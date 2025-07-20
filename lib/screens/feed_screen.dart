import 'package:flutter/material.dart';
import '../models/reel.dart';
import '../widgets/reel_card.dart';
import '../data/sample_reels.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: sampleReels.length,
      itemBuilder: (context, index) {
        final Reel reel = sampleReels[index];
        return ReelCard(reel: reel);
      },
    );
  }
}
