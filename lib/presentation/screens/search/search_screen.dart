

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/providers/personajes_provider.dart';
import 'package:rick_and_morty/presentation/widgets/widgets.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Buscar'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 5,right: 10),
            child: Icon(Icons.science,size: 35,),
          )
        ],
      ),
      
      body: const _SearchView(),

    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<PersonajesProvider>();
    return  Column(
      children: [

        const SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomTextField(
            label: '¿ Que personaje buscas ?',
            onChanged: (value) {
              searchProvider.search(value);
              if (value == '') {
                searchProvider.limpiarSearch();
              }
            },
          ),
        ),

        const SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
            itemCount: searchProvider.searchCharacters.length,
            itemBuilder: (BuildContext context, int index) {
              final character = searchProvider.searchCharacters[index];
              return CharacterSearch(
                character: character,
              );
            },
          ),
        )

      ],
    );
  }
}