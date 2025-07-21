import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'data/sample_reels.dart';

void main() {
  runApp(const RLReelsApp());
}

class RLReelsApp extends StatelessWidget {
  const RLReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RLReels',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(reels: sampleReels),
    );
  }
}
