import 'package:flutter/material.dart';

class FlavorConfig {
  final String appTitle;
  final String apiEndpoint;
  final ThemeData themeData;

  FlavorConfig({
    required this.appTitle,
    required this.apiEndpoint,
    required this.themeData,
  });

  factory FlavorConfig.simpsons() {
    return FlavorConfig(
      appTitle: 'Simpsons Character Viewer',
      apiEndpoint:
          'http://api.duckduckgo.com/?q=simpsons+characters&format=json',
      themeData: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE95525),
        ),
        useMaterial3: true,
      ),
    );
  }

  factory FlavorConfig.theWire() {
    return FlavorConfig(
      appTitle: 'The Wire Character Viewer',
      apiEndpoint:
          'http://api.duckduckgo.com/?q=the+wire+characters&format=json',
      themeData: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 37, 158, 233),
        ),
        useMaterial3: true,
      ),
    );
  }
}
