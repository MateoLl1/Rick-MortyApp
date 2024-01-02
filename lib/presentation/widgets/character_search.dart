

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/domain/domain.dart';

class CharacterSearch extends StatelessWidget {
  const CharacterSearch({
    super.key, 
    required this.character, 
  });
  final Personaje character;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.network(
            character.image,
          ),
          title: Text(character.nombre),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            context.push('/searchCh/${character.id}');
          },
        ),
        const SizedBox(height: 5,)
      ],
    );
  }
}