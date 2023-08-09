import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/flavor_config.dart';
import 'package:flutter_character_viewer/main_common.dart';

void main() {
  final simpsonsConfig = FlavorConfig(
    appTitle: 'Simspons Character Viewer',
    apiEndpoint: 'http://api.duckduckgo.com/?q=simpsons+characters&format=json',
    themeData: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFE95525),
      ),
      useMaterial3: true,
    ),
  );

  mainCommon(simpsonsConfig);
}
