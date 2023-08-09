import 'package:flutter/material.dart';
import 'package:flutter_character_viewer/providers/flavor_provider.dart';
import 'package:flutter_character_viewer/widgets/character_list_view.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<FlavorProvider>(context).config;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(config.appTitle),
      ),
      body: Center(
        child: CharacterListView(config: config),
      ),
    );
  }
}
