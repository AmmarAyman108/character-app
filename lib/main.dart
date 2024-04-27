import 'package:character_app/business_logic/cubit/characters_cubit.dart';
import 'package:character_app/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersCubit()..getAllCharacters(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CharactersScreen(),
        // BlocProvider(
        //   create: (context) => CharactersCubit()..getAllCharacters(),
        //   child: const CharactersScreen(),
        // ),
      ),
    );
  }
}
