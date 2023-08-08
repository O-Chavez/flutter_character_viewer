import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/models/character_model.dart';
import 'package:flutter_character_viewer/services/character_service.dart';
import 'package:flutter_character_viewer/widgets/character_view.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({Key? key}) : super(key: key);

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  late List<CharacterModel> characterList = [];
  late List<CharacterModel> filteredList = [];

  @override
  void initState() {
    super.initState();
    _getCharacters();
  }

  Future<void> _getCharacters() async {
    final characters = await CharacterService.getCharacters();
    setState(() {
      characterList = characters;
      filteredList = characters;
    });
  }

  void _filterCharacters(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredList = characterList;
      } else {
        filteredList = characterList
            .where((character) =>
                character.title.toLowerCase().contains(query.toLowerCase()) ||
                character.description
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search characters',
              ),
              onChanged: _filterCharacters,
            ),
          ),
          if (filteredList.isEmpty)
            const Center(
              child: Text('There are no characters to display'),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharacterView(
                              character: filteredList[index],
                            ),
                          ),
                        ),
                        child: ListTile(
                          title: Text(filteredList[index].title),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
