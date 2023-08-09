import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/flavor_config.dart';

class FlavorProvider with ChangeNotifier {
  final Flavor appFlavor;

  FlavorProvider({required this.appFlavor});

  Flavor get _currentFlavor => appFlavor;

  FlavorConfig get config {
    switch (_currentFlavor) {
      case Flavor.simpsons:
        return FlavorConfig.simpsons();
      case Flavor.theWire:
        return FlavorConfig.theWire();
      default:
        throw Exception('Unknown flavor: $_currentFlavor');
    }
  }
}

enum Flavor {
  simpsons,
  theWire,
}
