import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/flavor_config.dart';
import 'package:flutter_character_viewer/providers/flavor_provider.dart';
import 'package:flutter_character_viewer/widgets/home.dart';
import 'package:provider/provider.dart';

void mainCommon(FlavorConfig config) {
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FlavorProvider(config)),
    ],
    child: MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<FlavorProvider>(context).config;
    return MaterialApp(
      title: config.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE95525)),
        useMaterial3: true,
      ),
      home: const Home(title: 'Character Viewer'),
    );
  }
}
