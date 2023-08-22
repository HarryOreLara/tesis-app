import 'package:tesis_app/domain/entities/votos_entitie.dart';

class JokeList {
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

    JokeList({
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

    factory JokeList.fromJson(Map<String, dynamic> json) => JokeList(
        votos: Votos.fromJson(json["votos"]),
        id: json["_id"] ?? '',
        contenido: json["contenido"] ?? '',
        categoria: json["categoria"] ?? '',
        autor: json["autor"]!,
        nivelDificultad: json["nivelDificultad"]!,
        idioma: json["idioma"]!,
        popularidad: json["popularidad"],
        fuente: json["fuente"]!,
        imagenUrl: json["imagenUrl"]!,
        numeroDocumento: json["numeroDocumento"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );
}

//Para votos
        // newMedicine: List<MedicineList>.from(
        //     json["medicineList"].map((x) => MedicineList.fromJson(x))),
