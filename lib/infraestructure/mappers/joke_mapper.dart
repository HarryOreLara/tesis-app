import 'package:tesis_app/domain/entities/jokes_entitie.dart';
import 'package:tesis_app/domain/entities/votos_entitie.dart';
import 'package:tesis_app/infraestructure/models/entertainment/jokes_list_response.dart';

class JokeMapper {
  static Joke medicineDbToEntity(JokeList jokeList) => Joke(
      votos: Votos.fromJson(jokeList.votos.toJson()),
      id: jokeList.id,
      contenido: jokeList.contenido,
      categoria: jokeList.categoria,
      autor: jokeList.autor,
      nivelDificultad: jokeList.nivelDificultad,
      idioma: jokeList.idioma,
      popularidad: jokeList.popularidad,
      fuente: jokeList.fuente,
      imagenUrl: jokeList.imagenUrl,
      numeroDocumento: jokeList.numeroDocumento,
      createdAt: jokeList.createdAt,
      v: jokeList.v);
}

