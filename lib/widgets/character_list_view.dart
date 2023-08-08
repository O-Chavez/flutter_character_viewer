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

  @override
  void initState() {
    super.initState();
    _getCharacters();
  }

  Future<void> _getCharacters() async {
    final characters = await CharacterService.getCharacters();
    setState(() {
      characterList = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: characterList.isEmpty
          ? const Center(
              child: Text('There are no characters to display'),
            )
          : ListView.builder(
              itemCount: characterList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterView(
                            character: characterList[index],
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(characterList[index].title),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
