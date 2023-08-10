import 'dart:convert';
import 'package:flutter_character_viewer/models/character_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CharacterService {
  String apiEndpoint;
  final Client client;

  CharacterService({
    required this.apiEndpoint,
    Client? reqClient,
  }) : client = reqClient ?? http.Client();

  Future<List<CharacterModel>> getCharacters() async {
    final response = await client.get(Uri.parse(apiEndpoint));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final characters = data['RelatedTopics'] as List<dynamic>;

      final List<CharacterModel> characterList = characters
          .map((character) => CharacterModel.fromJson(character))
          .toList();

      return characterList;
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
