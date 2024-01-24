
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/domain.dart';
import 'package:rick_and_morty/infrastructure/infrastructure.dart';

class PersonajesProvider extends ChangeNotifier {
  
  final RickAndMortyRepositoryImpl repositoryImpl;

  PersonajesProvider({required this.repositoryImpl});
  final List<Personaje> personajes = [];
  final List<Personaje> personajesLista2 = [];
  final List<Personaje> personajesLista3 = [];
  final List<Personaje> searchCharacters = [];
  
  bool isLoading = true;

  Future<void> getCharacter({int page = 1})async{
    final newCharacter = await repositoryImpl.cargarPersonajes(page: page);
    personajes.addAll(newCharacter);
    isLoading = false;
    notifyListeners();
  }

  Future<void> getCharacter2({int page = 2})async{
    final newCharacter = await repositoryImpl.cargarPersonajes(page: page);
    personajesLista2.addAll(newCharacter);
    isLoading = false;
    notifyListeners();
  }

  Future<void> getCharacter3({int page = 3})async{
    final newCharacter = await repositoryImpl.cargarPersonajes(page: page);
    personajesLista3.addAll(newCharacter);
    isLoading = false;
    notifyListeners();
  }

  


  Future<void> search(String name)async{

    limpiarSearch();

    if (name.isEmpty) return;

    final search = await repositoryImpl.searchCharacterByName(name);

    searchCharacters.addAll(search);

    notifyListeners();
  }

  limpiarSearch(){
    searchCharacters.clear();
    notifyListeners();
  }


}