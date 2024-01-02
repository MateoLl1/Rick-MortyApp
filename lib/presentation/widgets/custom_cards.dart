

import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/domain.dart';
import 'package:rick_and_morty/presentation/widgets/loading_card.dart';



class CustomCards extends StatelessWidget {
  final Personaje personaje;
  const CustomCards({
    super.key, 
    required this.personaje
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              personaje.image,
              fit: BoxFit.cover,
              height: 190,
              width: 200,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const LoadingCard();
                }
                return child;

              },
            ),
          ),
    
          Text(personaje.nombre,style: textStyle.titleMedium,)
        ],
      ),
    );
  }
}