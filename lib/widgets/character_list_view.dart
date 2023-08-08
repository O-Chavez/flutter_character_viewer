import 'package:flutter/material.dart';

class CharacterListView extends StatelessWidget {
  final List<dynamic> characterList;

  const CharacterListView({Key? key, required this.characterList})
      : super(key: key);

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
                    SearchBar(),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/character',
                        arguments: characterList[index],
                      ),
                      child: ListTile(
                        title: Text(characterList[index]['name']),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
