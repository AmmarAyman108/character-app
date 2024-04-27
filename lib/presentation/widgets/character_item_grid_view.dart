// ignore: must_be_immutable
import 'package:character_app/data/models/character_model/character/character.dart';
import 'package:character_app/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CharacterItemGridView extends StatelessWidget {
  CharacterItemGridView({required this.characters, super.key});
  List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: characters.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemBuilder: (context, index) => CharacterItem(
        character: characters[index],
      ),
    );
  }
}
