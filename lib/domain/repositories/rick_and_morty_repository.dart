





import 'package:rick_and_morty/domain/entities/personaje.dart';

abstract class RickAndMortyRepository {
  
  Future<List<Personaje>> cargarPersonajes({int page = 1});

  Future<Personaje> personajeById(int id);

  Future<List<Personaje>> searchCharacterByName(String name);

}