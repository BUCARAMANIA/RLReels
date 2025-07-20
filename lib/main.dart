import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const RLReelsApp());
}

class RLReelsApp extends StatelessWidget {
  const RLReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RLReels',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomeScreen(),
    );
  }
}

