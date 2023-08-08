import 'package:flutter/material.dart';

class CharacterView extends StatelessWidget {
  final dynamic character;
  const CharacterView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // impliment the character image from the 'icon' property from the character object
          Image.network(character['icon']),
          const Text('Character Name'),
          const Text('Character Description'),
        ],
      ),
    );
  }
}
