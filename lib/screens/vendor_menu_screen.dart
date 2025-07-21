import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../data/sample_menus.dart';
import '../data/waitlist_store.dart';
import 'preorder_screen.dart';

class VendorMenuScreen extends StatelessWidget {
  final String vendorUsername;
  final String vendorImageUrl;

  const VendorMenuScreen({
    super.key,
    required this.vendorUsername,
    required this.vendorImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menu = vendorMenus[vendorUsername] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('@$vendorUsername Menu'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          CircleAvatar(
            backgroundImage: NetworkImage(vendorImageUrl),
            radius: 40,
          ),
          const SizedBox(height: 12),
          Text(
            '@$vendorUsername',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          const Text(
            'Menu',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Dynamic menu list
          Expanded(
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (context, index) {
                final item = menu[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.description),
                  trailing: Text('\$${item.price.toStringAsFixed(2)}'),
                );
              },
            ),
          ),

          // Action buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    final fakeUser = 'guest_user_${DateTime.now().millisecondsSinceEpoch}';
                    vendorWaitlist.putIfAbsent(vendorUsername, () => []);
                    vendorWaitlist[vendorUsername]!.add(fakeUser);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("You're now on @$vendorUsername's waitlist!"),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.timer),
                  label: const Text('Join Waitlist'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PreorderScreen(
                          vendorUsername: vendorUsername,
                          menuItems: menu,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Preorder'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
