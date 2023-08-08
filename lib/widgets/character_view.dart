import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/models/character_model.dart';

class CharacterView extends StatelessWidget {
  final CharacterModel character;
  const CharacterView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;
    final avatarRadius = isPortrait ? 150.0 : 100.0;

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
                CircleAvatar(
                  radius: avatarRadius,
                  child: Icon(
                    Icons.person,
                    size: isPortrait ? 100 : 75,
                  ),
                )
              else
                CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: NetworkImage(
                    character.image,
                  ),
                ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(character.description),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
