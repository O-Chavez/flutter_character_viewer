import 'dart:convert';
import 'package:http/http.dart' as http;

class CharacterService {
  static const String baseUrl =
      'http://api.duckduckgo.com/?q=simpsons+characters&format=json';

  static Future<List<dynamic>> getCharacters() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['Results'];
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
