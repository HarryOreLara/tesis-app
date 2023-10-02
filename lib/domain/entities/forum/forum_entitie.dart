class Forum {
  final String id;
  final String titulo;
  final String descripcion;
  final String creator;
  final String createdAt;

  Forum(
      {required this.id,
      required this.titulo,
      required this.descripcion,
      required this.creator,
      required this.createdAt});

  factory Forum.fromJson(Map<String, dynamic> json) => Forum(
      id: json["_id"] ?? '',
      titulo: json["titulo"] ?? '',
      descripcion: json["descripcion"] ?? '',
      creator: json["creator"] ?? '',
      createdAt: json["createdAt"] ?? '');

  Map<String, dynamic> toJson() {
    return {
      "titulo": titulo,
      "descripcion": descripcion,
      "creator": creator,
      "createdAt":createdAt
    };
  }
}
