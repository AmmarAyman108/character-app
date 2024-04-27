import 'package:character_app/business_logic/cubit/characters_cubit.dart';
import 'package:character_app/business_logic/cubit/characters_states.dart';
import 'package:character_app/data/models/character_model/character/character.dart';
import 'package:character_app/presentation/widgets/character_bloc_builder.dart';
import 'package:character_app/presentation/widgets/character_item_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.close,
            size: 25,
            color: Colors.black,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 25,
          color: Colors.black,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: Text('data'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return BlocBuilder<CharactersCubit, CharactersStates>(
            builder: (context, state) {
              if (state is CharactersFailureState) {
                return BuildErrorWidget(
                  errorMessage: state.errorMessage,
                );
              } else if (state is CharactersLoadedState) {
                List<Character> charactersSearch = state.characters
                    .where((element) =>
                        element.name!.toLowerCase().startsWith(query))
                    .toList();
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 7),
                  child: CharacterItemGridView(
                    characters: charactersSearch,
                  ),
                );
              } else {
                return const BuildLoadingIndicator();
              }
            },
          );
        } else {
          return const Center(
              child: Text(
            'No internet Connection!',
            style:
                TextStyle(color: Color.fromARGB(255, 255, 17, 0), fontSize: 16),
          ));
        }
      },
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
