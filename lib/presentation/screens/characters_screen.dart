import 'package:character_app/constants/colors.dart';
import 'package:character_app/presentation/widgets/character_bloc_builder.dart';
import 'package:character_app/presentation/widgets/custom_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColor.mainColor,
          title: const Text(
            '  Characters',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.white,
                ))
          ],
        ),
        backgroundColor: CustomColor.mainColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 7),
          child: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return const CharacterBlocBuilder();
              } else {
                return const Center(
                    child: Text(
                  'No internet Connection!',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 17, 0), fontSize: 16),
                ));
              }
            },
            child: const Center(
              child: Text(
                'hjsKHJKKKKK',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 17, 0), fontSize: 16),
              ),
            ),
          ),
        ));
  }
}
