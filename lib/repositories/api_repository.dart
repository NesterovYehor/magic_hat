import 'package:magic_hat/models/character_model.dart';
 
abstract class ApiRepository{
  Future<List<CharacterModel>> fetchCharacters();
}