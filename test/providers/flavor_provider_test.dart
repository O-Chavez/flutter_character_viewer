import 'package:flutter_character_viewer/providers/flavor_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlavorProvider Test', () {
    test('FlavorProvider returns correct config for Simpsons flavor', () {
      final flavorProvider = FlavorProvider(appFlavor: Flavor.simpsons);

      final config = flavorProvider.config;

      expect(config.apiEndpoint,
          'http://api.duckduckgo.com/?q=simpsons+characters&format=json');
      expect(config.appTitle, 'Simpsons Character Viewer');
    });

    test('FlavorProvider returns correct config for The Wire flavor', () {
      final flavorProvider = FlavorProvider(appFlavor: Flavor.theWire);

      final config = flavorProvider.config;

      expect(config.apiEndpoint,
          'http://api.duckduckgo.com/?q=the+wire+characters&format=json');
      expect(config.appTitle, 'The Wire Character Viewer');
    });
  });
}
