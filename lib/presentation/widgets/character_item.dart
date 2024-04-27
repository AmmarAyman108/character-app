import 'package:character_app/data/models/character_model/character/character.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CharacterItem extends StatelessWidget {
  CharacterItem({required this.character, super.key});
  Character character;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        footer: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.bottomCenter,
          // ignore: sort_child_properties_last
          child: Text(
            character.name!,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          color: Colors.black87.withOpacity(.7),
        ),
        child: Image.network(
          character.image!,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
