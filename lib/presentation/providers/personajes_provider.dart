
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/domain.dart';
import 'package:rick_and_morty/infrastructure/infrastructure.dart';

class PersonajesProvider extends ChangeNotifier {
  
  final RickAndMortyRepositoryImpl repositoryImpl;

  PersonajesProvider({required this.repositoryImpl});
  final scrollController = ScrollController();
  final List<Personaje> personajes = [];
  final List<Personaje> searchCharacters = [];
  
  bool isLoading = true;

  Future<void> getCharacter({int page = 1})async{
    final newCharacter = await repositoryImpl.cargarPersonajes(page: page);
    personajes.addAll(newCharacter);
    isLoading = false;
    notifyListeners();
  }

  posicionController (){
    final position = scrollController.position.context;

    print(position);
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