class RespuestaForo {
  final String id;
  final String creator;
  final String idForo;

  RespuestaForo(
      {required this.id, required this.creator, required this.idForo});

  factory RespuestaForo.fromJson(Map<String, dynamic> json) => RespuestaForo(
      id: json["_id"],
      creator: json["creador"] ?? '',
      idForo: json["idForo"] ?? '');

  Map<String, dynamic> toJson() {
    return {"creator": creator, "idForo": idForo};
  }
}
