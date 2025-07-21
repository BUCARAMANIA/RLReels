import '../models/menu_item.dart';

final Map<String, List<MenuItem>> vendorMenus = {
  'taco_truck_sf': [
    MenuItem(name: 'Taco Trio', description: 'Three classic street tacos', price: 12.99),
    MenuItem(name: 'Loaded Nachos', description: 'Beef, cheese, jalapeños', price: 9.49),
  ],
  'bbq_beast': [
    MenuItem(name: 'BBQ Plate', description: 'Ribs, brisket, slaw', price: 15.99),
    MenuItem(name: 'Pulled Pork Sandwich', description: 'Served with fries', price: 11.99),
  ],
  'vegan_delight': [
    MenuItem(name: 'Vegan Bowl', description: 'Quinoa, tofu, kale', price: 10.99),
    MenuItem(name: 'Plant Power Wrap', description: 'High-protein & fresh', price: 8.99),
  ],
};
