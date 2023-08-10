import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/models/character_model.dart';

class CharacterView extends StatelessWidget {
  final CharacterModel character;

  const CharacterView({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;
    final avatarRadius = isPortrait ? 150.0 : 125.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(character.title),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          Center(
            child: _buildAvatar(isPortrait, avatarRadius),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text('Description',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 20),
                Text(character.description),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(bool isPortrait, double avatarRadius) {
    final isImageAvailable = character.image.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: avatarRadius,
            child: isImageAvailable
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(avatarRadius),
                    child: Image.network(
                      character.image,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                : Icon(
                    Icons.person,
                    size: isPortrait ? 100 : 75,
                  ),
          ),
        ],
      ),
    );
  }
}
