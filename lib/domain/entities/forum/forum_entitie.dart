class Forum {
  final String id;
  final String titulo;
  final String descripcion;
  final int respuestas;
  final String creator;

  Forum(
      {required this.id,
      required this.titulo,
      required this.descripcion,
      required this.respuestas,
      required this.creator});

  factory Forum.fromJson(Map<String, dynamic> json) => Forum(
      id: json["_id"] ?? '',
      titulo: json["titulo"] ?? '',
      descripcion: json["descripcion"] ?? '',
      respuestas: json["respuestas"] ?? '',
      creator: json["creator"] ?? '');

  Map<String, dynamic> toJson() {
    return {
      "titulo":titulo,
      "descripcion": descripcion,
      "respuestas":respuestas,
      "creator":creator
    };
  }
}
