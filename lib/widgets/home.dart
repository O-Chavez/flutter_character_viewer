import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/widgets/character_list_view.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: CharacterListView(),
      ),
    );
  }
}
