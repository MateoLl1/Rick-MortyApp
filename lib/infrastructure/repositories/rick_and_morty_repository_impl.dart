


import 'package:rick_and_morty/domain/domain.dart';

class RickAndMortyRepositoryImpl implements RickAndMortyRepository {
  
  final RickAndMortyDatasource datasource;

  RickAndMortyRepositoryImpl({required this.datasource});
  
  @override
  Future<List<Personaje>> cargarPersonajes({int page = 1}) {
    return datasource.cargarPersonajes(page: page);
  }

  @override
  Future<Personaje> personajeById(int id) {
    // TODO: implement personajeById
    throw UnimplementedError();
  }
  
  @override
  Future<List<Personaje>> searchCharacterByName(String name) {
    return datasource.searchCharacterByName(name);
  }
  
}