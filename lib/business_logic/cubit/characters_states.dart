// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:character_app/data/models/character_model/character/character.dart';

abstract class CharactersStates {}

class CharactersInitialState extends CharactersStates {}

class CharactersLoadingState extends CharactersStates {}

class CharactersFailureState extends CharactersStates {
  String errorMessage;
  CharactersFailureState({
    required this.errorMessage,
  });
}

class CharactersLoadedState extends CharactersStates {
  List<Character> characters;
  CharactersLoadedState({
    required this.characters,
  });
}
