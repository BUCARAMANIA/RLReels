import 'package:flutter/material.dart';
import '../models/reel.dart';
import '../widgets/reel_card.dart';

class VendorProfileScreen extends StatelessWidget {
  final String vendorUsername;
  final String vendorImageUrl;
  final List<Reel> allReels;

  const VendorProfileScreen({
    super.key,
    required this.vendorUsername,
    required this.vendorImageUrl,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    final vendorReels = allReels.where((r) => r.vendorUsername == vendorUsername).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('@$vendorUsername'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          CircleAvatar(
            backgroundImage: NetworkImage(vendorImageUrl),
            radius: 40,
          ),
          const SizedBox(height: 12),
          const Text(
            'Vendor Bio Coming Soon',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: vendorReels.length,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 9 / 16,
                  child: ReelCard(reel: vendorReels[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
