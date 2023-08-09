import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/flavor_config.dart';

class FlavorProvider with ChangeNotifier {
  final FlavorConfig appConfig;

  FlavorProvider(this.appConfig);

  Flavor _currentFlavor = Flavor.simpsons;

  Flavor get currentFlavor => _currentFlavor;

  set currentFlavor(Flavor flavor) {
    _currentFlavor = flavor;
    notifyListeners();
  }

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
