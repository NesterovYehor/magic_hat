import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:magic_hat/models/character_model.dart';
import 'package:magic_hat/repositories/api_repository.dart';

class ApiRepositoryImpl extends ApiRepository {
  final Uri apiUrl = Uri.parse("https://hp-api.onrender.com/api/characters");

  @override
  Future<List<CharacterModel>> fetchCharacters() async {
    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        if (jsonData.isNotEmpty) {
          final characters = jsonData.map((character) => CharacterModel.fromJson(character)).toList();
          characters.removeWhere((element) => element.image.isEmpty);
          return characters;
        } else {
          throw Exception("No characters found in the response");
        }
      } else if (response.statusCode >= 300 && response.statusCode < 400) {
        throw Exception("Further action needs to be taken in order to complete the request: ${response.statusCode}");
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        throw Exception("The request contains bad syntax or cannot be fulfilled: ${response.statusCode}");
      } else if (response.statusCode >= 500 && response.statusCode < 600) {
        throw Exception("The server failed to fulfill an apparently valid request: ${response.statusCode}");
      } else {
        throw Exception("Unexpected error: ${response.statusCode}");
      }
    } catch (error) {
      rethrow; 
    }
  }
}
