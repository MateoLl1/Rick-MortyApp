import 'package:rick_and_morty/domain/domain.dart';
import 'package:rick_and_morty/infrastructure/infrastructure.dart';

class RickAndMortyMapper {
  static Personaje toEntityPersonaje(Result character) => Personaje(
    id: character.id,
    nombre: character.name,
    estado: character.status.name,
    especie:character.species.name,
    genero:character.gender.name,
    origen:character.origin.name,
    locacion:character.location.name,
    image:character.image
  );
}
