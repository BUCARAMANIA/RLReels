import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../data/sample_menus.dart';

class MenuEditorScreen extends StatefulWidget {
  final String vendorUsername;

  const MenuEditorScreen({super.key, required this.vendorUsername});

  @override
  State<MenuEditorScreen> createState() => _MenuEditorScreenState();
}

class _MenuEditorScreenState extends State<MenuEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();

  void _addMenuItem() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final desc = _descController.text;
      final price = double.tryParse(_priceController.text) ?? 0;

      final newItem = MenuItem(name: name, description: desc, price: price);
      vendorMenus.putIfAbsent(widget.vendorUsername, () => []);
      vendorMenus[widget.vendorUsername]!.add(newItem);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Menu item added!')),
      );

      _formKey.currentState!.reset();
      _nameController.clear();
      _descController.clear();
      _priceController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final menu = vendorMenus[widget.vendorUsername] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Item Name'),
                    validator: (val) => val == null || val.isEmpty ? 'Enter name' : null,
                  ),
                  TextFormField(
                    controller: _descController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (val) => val == null || val.isEmpty ? 'Enter description' : null,
                  ),
                  TextFormField(
                    controller: _priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        val == null || double.tryParse(val) == null ? 'Enter valid price' : null,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _addMenuItem,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Item'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Current Menu:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
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
          ],
        ),
      ),
    );
  }
}
