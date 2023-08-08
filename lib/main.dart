import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/widgets/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Character Viewer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE95525)),
        useMaterial3: true,
      ),
      home: const Home(title: 'Character Viewer'),
    );
  }
}
