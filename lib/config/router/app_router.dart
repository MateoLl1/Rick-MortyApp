

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/providers/personajes_provider.dart';
import 'package:rick_and_morty/presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),

    GoRoute(
      path: '/character/:id',
      builder: (context, state) {
        final idCharacter = state.pathParameters['id'] ?? '0';
        final personajeProvider = context.read<PersonajesProvider>();

        final character = personajeProvider.personajes.firstWhere(
          (element) => element.id == int.parse(idCharacter),
        );
        return CharacterScreen(personaje: character,);
      },
    ),
    GoRoute(
      path: '/character2/:id',
      builder: (context, state) {
        final idCharacter = state.pathParameters['id'] ?? '0';
        final personajeProvider = context.read<PersonajesProvider>();

        final character = personajeProvider.personajesLista2.firstWhere(
          (element) => element.id == int.parse(idCharacter),
        );
        return CharacterScreen(personaje: character,);
      },
    ),
    
    GoRoute(
      path: '/character3/:id',
      builder: (context, state) {
        final idCharacter = state.pathParameters['id'] ?? '0';
        final personajeProvider = context.read<PersonajesProvider>();

        final character = personajeProvider.personajesLista3.firstWhere(
          (element) => element.id == int.parse(idCharacter),
        );
        return CharacterScreen(personaje: character,);
      },
    ),


    GoRoute(
      path: '/searchCh/:id',
      builder: (context, state) {
        final idCharacter = state.pathParameters['id'] ?? '0';
        final searchProvider = context.read<PersonajesProvider>();
        final character = searchProvider.searchCharacters.
          firstWhere(
            (element) => element.id == int.parse(idCharacter)
          );
        return CharacterScreen(personaje: character);
      },
    )

  ]
);