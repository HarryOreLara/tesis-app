class PreguntasPuntuadasSoledad {
  final String idPregunta;
  final String contenido;
  final String respuesta;

  PreguntasPuntuadasSoledad(
      {required this.idPregunta,
      required this.contenido,
      required this.respuesta});

  factory PreguntasPuntuadasSoledad.fromJson(Map<String, dynamic> json) =>
      PreguntasPuntuadasSoledad(
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

