import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_character_viewer/models/character_model.dart';
import 'package:flutter_character_viewer/services/character_service.dart';
import 'package:flutter_character_viewer/widgets/character_list_view.dart';

void main() {
  group('CharacterListView', () {
    late List<CharacterModel> characters;

    setUpAll(() async {
      characters = await CharacterService.getCharacters();
    });

    testWidgets('should display characters', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CharacterListView(),
          ),
        ),
      );

      expect(find.text(characters[0].title), findsOneWidget);
      expect(find.text(characters[1].title), findsOneWidget);
      expect(find.text(characters[2].title), findsOneWidget);
    });

    testWidgets('should filter characters', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CharacterListView(),
          ),
        ),
      );

      final searchField = find.byType(TextField);
      await tester.enterText(searchField, 'Iron Man');

      expect(find.text('Iron Man'), findsOneWidget);
      expect(find.text('Captain America'), findsNothing);
      expect(find.text('Thor'), findsNothing);
    });

    testWidgets('should display no characters message',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CharacterListView(),
          ),
        ),
      );

      final searchField = find.byType(TextField);
      await tester.enterText(searchField, 'Invalid Search Query');

      expect(find.text('There are no characters to display'), findsOneWidget);
    });
  });
}
