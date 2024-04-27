import 'package:character_app/data/wed_services/api_methods.dart';

class AllCharacters {
  Future<List<dynamic>> getAllCharacters() async {
    Map jsonData = await Api().get(endPoint: '/character');
    List<dynamic> charactersList = jsonData['results'];
    return charactersList;
  }
}
