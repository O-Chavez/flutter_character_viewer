import 'dart:convert';
import 'package:flutter_character_viewer/models/character_model.dart';
import 'package:flutter_character_viewer/services/character_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements http.Client {
  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return super.noSuchMethod(
      Invocation.method(#get, [url, headers]),
      returnValue: Future.value(http.Response('Mock Response', 200)),
    );
  }
}

void main() {
  group('CharacterService Test', () {
    late CharacterService characterService;
    late MockHttpClient mockHttpClient;

    const apiEndpoint = 'https://example.com/api/characters';

    setUp(() {
      mockHttpClient = MockHttpClient();
      characterService =
          CharacterService(apiEndpoint: apiEndpoint, reqClient: mockHttpClient);
    });

    test('getCharacters returns list of characters on success', () async {
      final mockResponse = http.Response(
        jsonEncode({
          'RelatedTopics': [
            {
              "Text": "Character 1 - Description 1",
              "Icon": {"URL": "image1.jpg"}
            }
          ]
        }),
        200,
      );
      when(mockHttpClient.get(Uri.parse(apiEndpoint)))
          .thenAnswer((_) async => mockResponse);

      final result = await characterService.getCharacters();

      expect(result.length, 1);
      expect(result[0].title, 'Character 1');
      expect(result[0].description, 'Description 1');
      expect(result[0].image, 'https://duckduckgo.com/image1.jpg');
    });

    test('getCharacters throws exception on error', () async {
      final mockResponse = http.Response('Error', 500);
      when(mockHttpClient.get(Uri.parse(apiEndpoint)))
          .thenAnswer((_) async => mockResponse);

      expect(() => characterService.getCharacters(), throwsException);
    });

    // You can add more tests to cover edge cases and different scenarios
  });
}
