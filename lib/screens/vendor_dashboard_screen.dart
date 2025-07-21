import 'package:flutter/material.dart';
import '../data/waitlist_store.dart';
import '../data/sample_menus.dart';
import '../models/menu_item.dart';
import 'menu_editor_screen.dart';

class VendorDashboardScreen extends StatelessWidget {
  final String vendorUsername;

  const VendorDashboardScreen({
    super.key,
    required this.vendorUsername,
  });

  @override
  Widget build(BuildContext context) {
    final waitlist = vendorWaitlist[vendorUsername] ?? [];
    final menu = vendorMenus[vendorUsername] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('@$vendorUsername Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Waitlist (${waitlist.length})',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            waitlist.isEmpty
                ? const Text('No users currently on the waitlist.')
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: waitlist
                        .map((user) => Text('- $user', style: const TextStyle(fontSize: 14)))
                        .toList(),
                  ),
            const SizedBox(height: 24),
            const Text(
              'Top Menu Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: menu
                  .map((item) => Text('• ${item.name} - \$${item.price.toStringAsFixed(2)}'))
                  .toList(),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MenuEditorScreen(vendorUsername: vendorUsername),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit My Menu'),
              ),
            ),
            const Spacer(),
            const Text(
              '🚀 More analytics, revenue tracking, and queue control coming soon!',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
