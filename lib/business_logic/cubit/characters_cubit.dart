import 'package:character_app/business_logic/cubit/characters_states.dart';
import 'package:character_app/data/models/character_model/character/character.dart';
import 'package:character_app/data/repositories/all_character_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersCubit extends Cubit<CharactersStates> {
  CharactersCubit() : super(CharactersInitialState());
  late List<Character> characters;

  getAllCharacters() {
    emit(CharactersLoadingState());
    try {
      AllCharacterRepository().getAllCharacter().then((characters) {
        emit(CharactersLoadedState(characters: characters));
        this.characters = characters;
      });
    } catch (e) {
      emit(CharactersFailureState(
        errorMessage: e.toString(),
      ));
    }
  }
}
