import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_character_viewer/blocs/character_list_bloc.dart';
import 'package:flutter_character_viewer/models/character_model.dart';
import 'package:flutter_character_viewer/services/character_service.dart';
import 'package:mockito/mockito.dart';

class MockCharacterService extends Mock implements CharacterService {
  @override
  Future<List<CharacterModel>> getCharacters() {
    return super.noSuchMethod(
      Invocation.method(#getCharacters, []),
      returnValue: Future.value([
        CharacterModel(
          title: 'Character 1',
          description: 'Description 1',
          image: 'https://duckduckgo.com/i/1.jpg',
        ),
      ]),
    );
  }
}

void main() {
  late CharacterListBloc bloc;
  late MockCharacterService mockCharacterService;

  setUp(() {
    mockCharacterService = MockCharacterService();
    bloc = CharacterListBloc(service: mockCharacterService);
  });

  tearDown(() {
    bloc.dispose();
  });

  final characters = [
    CharacterModel(
      title: 'Character 1',
      description: 'Description 1',
      image: 'https://duckduckgo.com/i/1.jpg',
    ),
    CharacterModel(
      title: 'Character 2',
      description: 'Description 2',
      image: 'https://duckduckgo.com/i/2.jpg',
    ),
    CharacterModel(
      title: 'Character 3',
      description: 'Description 3',
      image: 'https://duckduckgo.com/i/3.jpg',
    ),
  ];

  group('getCharacters', () {
    test('should populate characterList with characters from service',
        () async {
      when(mockCharacterService.getCharacters())
          .thenAnswer((_) async => characters);

      await bloc.getCharacters();

      expect(bloc.characterList, equals(characters));
    });
  });

  group('filterCharacters', () {
    setUp(() {
      bloc.characterList.addAll(characters);
    });

    test('should add all characters to filteredList when query is empty', () {
      bloc.filterCharacters('');

      expect(bloc.filteredList, equals(bloc.characterList));
    });

    test(
        'should add matching characters to filteredList when query is not empty',
        () {
      bloc.filterCharacters('2');

      expect(bloc.filteredList, equals([bloc.characterList[1]]));
    });

    test(
        'should add matching characters to filteredList when query is not empty (case-insensitive)',
        () {
      bloc.filterCharacters('cHaRaCtEr 2');

      expect(bloc.filteredList, equals([bloc.characterList[1]]));
    });

    test(
        'should add matching characters to filteredList when query matches description',
        () {
      bloc.filterCharacters('description');

      expect(bloc.filteredList, equals(bloc.characterList));
    });

    test('should add no characters to filteredList when query does not match',
        () {
      bloc.filterCharacters('xyz');

      expect(bloc.filteredList, isEmpty);
    });
  });
}
