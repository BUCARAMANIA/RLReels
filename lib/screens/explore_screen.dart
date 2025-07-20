import 'package:flutter/material.dart';
import '../data/sample_reels.dart';
import '../widgets/explore_item.dart';
import 'feed_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: sampleReels.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 9 / 16,
        ),
        itemBuilder: (context, index) {
          final reel = sampleReels[index];
          return ExploreItem(
            reel: reel,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FeedScreen(initialIndex: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
