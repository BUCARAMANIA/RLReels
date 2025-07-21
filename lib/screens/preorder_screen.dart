import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class PreorderScreen extends StatefulWidget {
  final String vendorUsername;
  final List<MenuItem> menuItems;

  const PreorderScreen({
    super.key,
    required this.vendorUsername,
    required this.menuItems,
  });

  @override
  State<PreorderScreen> createState() => _PreorderScreenState();
}

class _PreorderScreenState extends State<PreorderScreen> {
  MenuItem? _selectedItem;
  int _quantity = 1;
  TimeOfDay _pickupTime = TimeOfDay.now();

  void _selectPickupTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _pickupTime,
    );
    if (picked != null) {
      setState(() {
        _pickupTime = picked;
      });
    }
  }

  void _confirmOrder() {
    if (_selectedItem == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a menu item')),
      );
      return;
    }

    final total = _selectedItem!.price * _quantity;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm Preorder'),
        content: Text(
          'Item: ${_selectedItem!.name}\n'
          'Quantity: $_quantity\n'
          'Pickup Time: ${_pickupTime.format(context)}\n'
          'Total: \$${total.toStringAsFixed(2)}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Preorder confirmed!')),
              );
              Navigator.pop(context); // go back to menu screen
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('@${widget.vendorUsername} Preorder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<MenuItem>(
              hint: const Text('Select Menu Item'),
              isExpanded: true,
              value: _selectedItem,
              items: widget.menuItems.map((item) {
                return DropdownMenuItem<MenuItem>(
                  value: item,
                  child: Text('${item.name} - \$${item.price.toStringAsFixed(2)}'),
                );
              }).toList(),
              onChanged: (item) {
                setState(() => _selectedItem = item);
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Quantity:'),
                const SizedBox(width: 16),
                DropdownButton<int>(
                  value: _quantity,
                  items: List.generate(10, (i) => i + 1).map((num) {
                    return DropdownMenuItem(value: num, child: Text(num.toString()));
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _quantity = val);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Pickup Time:'),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => _selectPickupTime(context),
                  child: Text(_pickupTime.format(context)),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: _confirmOrder,
              icon: const Icon(Icons.check_circle),
              label: const Text('Submit Preorder'),
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
            ),
          ],
        ),
      ),
    );
  }
}
