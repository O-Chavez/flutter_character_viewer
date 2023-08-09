import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/flavor_config.dart';
import 'package:flutter_character_viewer/main_common.dart';

void main() {
  final theWireConfig = FlavorConfig(
    appTitle: 'The Wire Character Viewer',
    apiEndpoint: 'http://api.duckduckgo.com/?q=simpsons+characters&format=json',
    themeData: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 37, 158, 233),
      ),
      useMaterial3: true,
    ),
  );

  mainCommon(theWireConfig);
}
