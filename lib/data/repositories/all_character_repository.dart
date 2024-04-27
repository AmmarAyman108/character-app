import 'package:character_app/data/models/character_model/character/character.dart';
import 'package:character_app/data/wed_services/all_characters.dart';

class AllCharacterRepository {
  Future<List<Character>> getAllCharacter() async {
    List<dynamic> characterList = await AllCharacters().getAllCharacters();
    List<Character> characterModelList =
        characterList.map((e) => Character.fromJson(e)).toList();
    return characterModelList;
  }
}
