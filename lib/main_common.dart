import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/providers/flavor_provider.dart';
import 'package:flutter_character_viewer/widgets/home.dart';
import 'package:provider/provider.dart';

void mainCommon(Flavor flavor) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => FlavorProvider(
                  appFlavor: flavor,
                )),
      ],
      child: const MyApp(),
    ),
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
        colorScheme: config.themeData.colorScheme,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
