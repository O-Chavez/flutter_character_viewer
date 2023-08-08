import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/models/character_model.dart';

class CharacterView extends StatelessWidget {
  final CharacterModel character;
  const CharacterView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(character.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (character.image.isEmpty)
                const CircleAvatar(
                  radius: 100,
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                )
              else
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    character.image,
                  ),
                ),
              const SizedBox(height: 20),
              Text(character.description),
            ],
          ),
        ),
      ),
    );
  }
}
