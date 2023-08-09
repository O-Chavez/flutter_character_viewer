import 'package:flutter_character_viewer/models/character_model.dart';
import 'package:flutter_character_viewer/services/character_service.dart';
import 'dart:async';

class CharacterListBloc {
  final _characterListController = StreamController<List<CharacterModel>>();
  Stream<List<CharacterModel>> get filteredListStream =>
      _characterListController.stream;

  List<CharacterModel> characterList = [];
  List<CharacterModel> filteredList = [];

  Future<void> getCharacters() async {
    final characters = await CharacterService.getCharacters();
    characterList = characters;
    filterCharacters('');
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
    _characterListController.add(filteredList);
  }

  void dispose() {
    _characterListController.close();
  }
}
