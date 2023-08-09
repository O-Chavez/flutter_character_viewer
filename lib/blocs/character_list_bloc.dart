import 'package:flutter_character_viewer/flavor_config.dart';
import 'package:flutter_character_viewer/models/character_model.dart';
import 'package:flutter_character_viewer/services/character_service.dart';
import 'dart:async';

class CharacterListBloc {
  final _characterListController = StreamController<List<CharacterModel>>();

  Stream<List<CharacterModel>> get filteredListStream async* {
    yield* _characterListController.stream;
  }

  final List<CharacterModel> characterList;
  final List<CharacterModel> filteredList;

  final CharacterService characterService;

  CharacterListBloc({
    required FlavorConfig config,
    CharacterService? service, // dependency injection for testing
  })  : characterService =
            service ?? CharacterService(apiEndpoint: config.apiEndpoint),
        characterList = [],
        filteredList = [];

  Future<void> getCharacters() async {
    final characters = await characterService.getCharacters();
    characterList.clear();
    characterList.addAll(characters);
    filterCharacters('');
  }

  void filterCharacters(String query) {
    if (query.isEmpty) {
      filteredList.clear();
      filteredList.addAll(characterList);
    } else {
      filteredList.clear();
      filteredList.addAll(characterList.where((character) =>
          character.title.toLowerCase().contains(query.toLowerCase()) ||
          character.description.toLowerCase().contains(query.toLowerCase())));
    }
    _characterListController.add(filteredList);
  }

  void dispose() {
    _characterListController.close();
  }
}
