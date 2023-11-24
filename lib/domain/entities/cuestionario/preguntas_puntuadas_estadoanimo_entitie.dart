import 'package:tesis_app/core/utils/typedef.dart';

class PreguntasPuntuadasEstadoAnimo {
  final String idPregunta;
  final String contenido;
  final String respuesta;

  PreguntasPuntuadasEstadoAnimo(
      {required this.idPregunta,
      required this.contenido,
      required this.respuesta});

  factory PreguntasPuntuadasEstadoAnimo.fromJson(DataMap json) =>
      PreguntasPuntuadasEstadoAnimo(
          idPregunta: json["idPregunta"],
          contenido: json["contenido"],
          respuesta: json["respuesta"]);

  DataMap toJson() {
    return {
      'idPregunta': idPregunta,
      'contenido': contenido,
      'respuesta': respuesta
    };
  }
}
