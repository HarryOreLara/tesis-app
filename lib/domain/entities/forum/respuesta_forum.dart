class RespuestaForo {
  final String id;
  final String creator;
  final String contenido;
  final String idForo;
  final String createdAt;

  RespuestaForo(
      {required this.contenido,
      required this.id,
      required this.creator,
      required this.idForo,
      required this.createdAt});

  factory RespuestaForo.fromJson(Map<String, dynamic> json) => RespuestaForo(
      id: json["_id"] ?? '',
      contenido: json["contenido"] ?? '',
      creator: json["creador"] ?? '',
      idForo: json["idForo"] ?? '',
      createdAt: json["createdAt"] ?? '');

  Map<String, dynamic> toJson() {
    return {"creator": creator, "idForo": idForo, "contenido": contenido,};
  }
}
