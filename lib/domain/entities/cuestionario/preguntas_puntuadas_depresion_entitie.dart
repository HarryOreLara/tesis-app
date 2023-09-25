class PreguntasPuntuadasDepresion {
  final String idPregunta;
  final String contenido;
  final bool respuesta;

  PreguntasPuntuadasDepresion(
      {required this.idPregunta,
      required this.contenido,
      required this.respuesta});

  factory PreguntasPuntuadasDepresion.fromJson(Map<String, dynamic> json) =>
      PreguntasPuntuadasDepresion(
          idPregunta: json["idPregunta"] ?? '',
          contenido: json["contenido"] ?? '',
          respuesta: json["respuesta"] ?? '');

  Map<String, dynamic> toJson() {
    return {
      'idPregunta':idPregunta,
      'contenido':contenido,
      'respuesta':respuesta
    };
  }
}

