import 'package:flutter/material.dart';
import '../models/reel.dart';

class ExploreItem extends StatelessWidget {
  final Reel reel;
  final VoidCallback onTap;

  const ExploreItem({
    super.key,
    required this.reel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(reel.thumbnailUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [Colors.black54, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@${reel.vendorUsername}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  reel.caption,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
