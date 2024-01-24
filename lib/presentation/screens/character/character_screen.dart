

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/domain/domain.dart';

class CharacterScreen extends StatelessWidget {
  final Personaje personaje;
  const CharacterScreen({
    super.key, 
    required this.personaje
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _CharacterView(character: personaje),
    );
  }
}

class _CharacterView extends StatelessWidget {
  const _CharacterView(
    {required this.character}
  );
  final Personaje character;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ListView(

        children: [

          Stack(
          children: [
        
            _CharacterContent(character: character),
        
        
            Positioned(
              top: size.height*.03,
              left: size.width*.05,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.greenAccent,
                  size: 40,
                ),
                onPressed: (){
                  context.go('/');
                }, 
              )
            ),
            
        
          ],
        ),

        ],
      ),
    );
  }
}

class _CharacterContent extends StatelessWidget {
  const _CharacterContent({
    required this.character,
  });

  final Personaje character;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Image.network(
            character.image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
    
        Text(character.nombre,style: textStyle.labelLarge,),
        
        
        Row(
          children: [
            _TextContent(
          content: character.estado, label: 'Status:'
        ),
        const Spacer(),
        _TextContent(
          content: character.especie, label: 'Specie:'
        ),
          ],
        ),
    
        _TextContent(
          content: character.genero, label: 'Gender: '
        ),
    
      
        _TextContent(
          label: 'Origin: ',
          content: character.origen,
          widthMax: true,
        ),
    
        _TextContent(
          widthMax: true,
          label: 'Last Known location: ',
          content: character.locacion,
        )
        
    
        
    
    
    
      ],
    );
  }
}

class _TextContent extends StatelessWidget {
  const _TextContent({
    required this.content,
    required this.label, 
    this.widthMax = false,
  });
  final bool widthMax;
  final String content;
  final String label;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      width: widthMax
      ? double.maxFinite
      : null,
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(label,style: textStyle.labelMedium,),
          Text(content,style: textStyle.labelSmall,),
        ],
      ),
    );
  }
}