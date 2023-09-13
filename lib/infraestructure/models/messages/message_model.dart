class MessageModel {
  final String mensaje;
  final String emisor;
  final String receptor;
  final bool leido;

  MessageModel(
      {required this.mensaje,
      required this.emisor,
      required this.receptor,
      required this.leido});

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
      mensaje: json["mensaje"] ?? '',
      emisor: json["emisor"] ?? '',
      receptor: json["receptor"] ?? '',
      leido: json["leido"] ?? '');

  Map<String, dynamic> toJson() {
    return {
      "mensaje": mensaje,
      "emisor": emisor,
      "receptor": receptor,
      "leido": leido
    };
  }
}
