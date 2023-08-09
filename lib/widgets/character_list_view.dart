import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/blocs/character_list_bloc.dart';
import 'package:flutter_character_viewer/models/character_model.dart';
import 'package:flutter_character_viewer/widgets/character_view.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({Key? key}) : super(key: key);

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  late CharacterListBloc _characterBloc;

  @override
  void initState() {
    super.initState();
    _characterBloc = CharacterListBloc()..getCharacters();
  }

  @override
  void dispose() {
    _characterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          _buildSearchTextField(),
          StreamBuilder<List<CharacterModel>>(
            stream: _characterBloc.filteredListStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildLoadingIndicator();
              } else if (snapshot.hasError) {
                return _buildErrorMessage();
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return _buildNoCharactersMessage();
              } else {
                return _buildCharacterList(snapshot.data!);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search characters',
        ),
        onChanged: _characterBloc.filterCharacters,
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorMessage() {
    return const Center(
      child: Text('An error occurred while fetching data.'),
    );
  }

  Widget _buildNoCharactersMessage() {
    return const Center(
      child: Text('There are no characters to display.'),
    );
  }

  Widget _buildCharacterList(List<CharacterModel> characters) {
    return Expanded(
      child: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterView(
                    character: characters[index],
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text(characters[index].title),
            ),
          );
        },
      ),
    );
  }
}
