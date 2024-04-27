import 'package:character_app/business_logic/cubit/characters_cubit.dart';
import 'package:character_app/business_logic/cubit/characters_states.dart';
import 'package:character_app/presentation/widgets/character_item_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterBlocBuilder extends StatelessWidget {
  const CharacterBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersStates>(
      builder: (context, state) {
        if (state is CharactersFailureState) {
          return BuildErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else if (state is CharactersLoadedState) {
          return CharacterItemGridView(
            characters: state.characters,
          );
        } else {
          return const BuildLoadingIndicator();
        }
      },
    );
  }
}

// ignore: must_be_immutable
class BuildErrorWidget extends StatelessWidget {
  BuildErrorWidget({super.key, required this.errorMessage});
  String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}

class BuildLoadingIndicator extends StatelessWidget {
  const BuildLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
