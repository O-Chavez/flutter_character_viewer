import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/blocs/character_list_bloc.dart';
import 'package:flutter_character_viewer/widgets/character_view.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({Key? key}) : super(key: key);

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  final _characterBloc = CharacterListBloc();

  @override
  void initState() {
    super.initState();
    _characterBloc.getCharacters();
  }

  void _filterCharacters(String query) {
    setState(() {
      _characterBloc.filterCharacters(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        if (_characterBloc.filteredList.isEmpty)
          const Center(
            child: Text('There are no characters to display'),
          )
        else
          Expanded(
            child: ListView.builder(
              itemCount: _characterBloc.filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterView(
                            character: _characterBloc.filteredList[index],
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          _characterBloc.filteredList[index].title,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }

  // @override
  // void dispose() {
  //   _characterBloc.dispose();
  //   super.dispose();
  // }
}
