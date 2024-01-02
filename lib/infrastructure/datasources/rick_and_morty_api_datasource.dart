


import 'package:dio/dio.dart';
import 'package:rick_and_morty/domain/domain.dart';
import 'package:rick_and_morty/infrastructure/infrastructure.dart';

class RickAndMortyApiDatasource implements RickAndMortyDatasource {
  
  final dio = Dio();


  @override
  Future<List<Personaje>> cargarPersonajes({int page = 1})async {
    
    final response = await dio.get('https://rickandmortyapi.com/api/character/?page=$page');

    final carlitos = RickAndMortyPersonajesModel.fromJson(response.data);

    final newPersonaje = carlitos.results.map(
      (person) => RickAndMortyMapper.toEntityPersonaje(person)
    ).toList();
    
    return newPersonaje;

  }

  @override
  Future<Personaje> personajeById(int id) {
    // TODO: implement personajeById
    throw UnimplementedError();
  }
  
  @override
  Future<List<Personaje>> searchCharacterByName(String name)async {
    try {
      final response = await dio.get('https://rickandmortyapi.com/api/character?name=$name');

      final characters = RickAndMortyPersonajesModel.fromJson(response.data);

      final searchCharacters = characters.results.map(
        (character) => RickAndMortyMapper.toEntityPersonaje(character)
      ).toList();

      return searchCharacters;
    } catch (e) {
      return [];
    }


    
  }
  
}