import 'package:flutter_character_viewer/models/character_model.dart';
import 'package:flutter_character_viewer/services/character_service.dart';

class CharacterListBloc {
  late List<CharacterModel> characterList = [];
  late List<CharacterModel> filteredList = [];

  Future<void> getCharacters() async {
    final characters = await CharacterService.getCharacters();
    characterList = characters;
    if (filteredList.isEmpty) {
      filteredList = characters;
    }
  }

  void filterCharacters(String query) {
    if (query.isEmpty) {
      filteredList = characterList;
    } else {
      filteredList = characterList
          .where((character) =>
              character.title.toLowerCase().contains(query.toLowerCase()) ||
              character.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
