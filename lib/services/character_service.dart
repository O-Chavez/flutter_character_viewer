import 'dart:convert';
import 'package:flutter_character_viewer/models/character_model.dart';
import 'package:http/http.dart' as http;

class CharacterService {
  static const String baseUrl =
      'http://api.duckduckgo.com/?q=simpsons+characters&format=json';

  static Future<List<CharacterModel>> getCharacters() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final characters = data['RelatedTopics'] as List<dynamic>;

      return characters
          .map((character) => CharacterModel.fromJson(character))
          .toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
