import 'package:flutter_character_viewer/models/character_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CharacterModel Test', () {
    test('CharacterModel fromJson constructs correctly', () {
      final json = {
        'Text': 'Character 1 - Description 1',
        'Icon': {'URL': 'image1.jpg'}
      };

      final character = CharacterModel.fromJson(json);

      expect(character.title, 'Character 1');
      expect(character.description, 'Description 1');
      expect(character.image, 'https://duckduckgo.com/image1.jpg');
    });

    test('CharacterModel fromJson handles empty description', () {
      final json = {
        'Text': 'Character 2',
        'Icon': {'URL': 'image2.jpg'}
      };

      final character = CharacterModel.fromJson(json);

      expect(character.title, 'Character 2');
      expect(character.description, '');
      expect(character.image, 'https://duckduckgo.com/image2.jpg');
    });

    test('CharacterModel fromJson handles missing Icon', () {
      final json = {
        'Text': 'Character 3 - Description 3',
        'Icon': {'URL': ''},
      };

      final character = CharacterModel.fromJson(json);

      expect(character.title, 'Character 3');
      expect(character.description, 'Description 3');
      expect(character.image, '');
    });

    test('CharacterModel fromJson handles missing text parts', () {
      final json = {
        'Text': 'Character 4',
        'Icon': {'URL': 'image4.jpg'}
      };

      final character = CharacterModel.fromJson(json);

      expect(character.title, 'Character 4');
      expect(character.description, '');
      expect(character.image, 'https://duckduckgo.com/image4.jpg');
    });
  });
}
