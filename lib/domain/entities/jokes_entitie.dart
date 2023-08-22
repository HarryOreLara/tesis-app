import 'package:tesis_app/domain/entities/votos_entitie.dart';

class Joke {
    final Votos votos;
    final String id;
    final String contenido;
    final String categoria;
    final String autor;
    final String nivelDificultad;
    final String idioma;
    final int popularidad;
    final String fuente;
    final String imagenUrl;
    final int numeroDocumento;
    final DateTime createdAt;
    final int v;

    Joke({
        required this.votos,
        required this.id,
        required this.contenido,
        required this.categoria,
        required this.autor,
        required this.nivelDificultad,
        required this.idioma,
        required this.popularidad,
        required this.fuente,
        required this.imagenUrl,
        required this.numeroDocumento,
        required this.createdAt,
        required this.v,
    });
}


