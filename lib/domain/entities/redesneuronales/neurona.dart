class Neurona {
  final String idPersona;
  final String frase;
  final String fecha;

  Neurona(
      {required this.idPersona,
      required this.frase,
      required this.fecha});

  factory Neurona.fromJson(Map<String, dynamic> json) => Neurona(
      idPersona: json["idPersona"] ?? '',
      frase: json["frase"] ?? '',
      fecha: json["fecha"] ?? '');

  Map<String, dynamic> toJson() {
    return {
      "idPersona": idPersona,
      "frase": frase,
      "fecha": fecha
    };
  }
}
