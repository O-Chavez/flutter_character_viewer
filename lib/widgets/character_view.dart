import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/models/character_model.dart';

class CharacterView extends StatelessWidget {
  final CharacterModel character;
  const CharacterView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text('Character Viewer'),
      ),
      body: Center(
        child: Column(
          children: [
            // impliment the character image from the 'icon' property from the character object
            Image.network('https://duckduckgo.com/${character.image}'),
            const Text('Character Name'),
            const Text('Character Description'),
          ],
        ),
      ),
    );
  }
}
