

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/domain/domain.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';
import 'package:rick_and_morty/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final personajesProvider = context.watch<PersonajesProvider>();
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.push('/search');
        },
        child: const Icon(Icons.search,),
      ),

      body: personajesProvider.isLoading
      ? const Center(child: CircularProgressIndicator(),)
      : SingleChildScrollView(
        child: Column(
          children: [
      
            const LogoHome(),
      
      
            _HomeView(
              personajes: personajesProvider.personajes,
              title: 'Personajes principales',
            ),

            _HomeView(
              personajes: personajesProvider.personajes,
              title: 'Personajes secundarios',
            ),
            _HomeView(
              personajes: personajesProvider.personajes,
              title: 'Otros personajes',
            ),
            

            const SizedBox(height: 30,)
      
          ],
        ),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  
  final List<Personaje> personajes;
  final String title;
  const _HomeView({required this.personajes, required this.title});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PersonajesProvider>();
    return SizedBox(
      height: 260,
      child: Column(
        children: [

          _Title(title: title),
          
          
          Expanded(
          child: ListView.builder(
            controller: controller.scrollController,
            itemCount: personajes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final personaje = personajes[index];
              return GestureDetector(
                onTap: () {
                  context.push('/character/${personaje.id}');
                },
                child: CustomCards(personaje: personaje,)
              );
            },
          ),
        ),



        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  
  final String title;
  const _Title({required this.title});


  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title,style: textStyle.titleLarge,),
          
        ],
      ),
    );
  }
}