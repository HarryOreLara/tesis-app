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


List<MessageModel> messagesModel = [
  MessageModel(mensaje: "Hola como estas", emisor: "idHarry", receptor: "idArles", leido: true),
  MessageModel(mensaje: "Todo bien", emisor: "idArles", receptor: "idHarry", leido: true),
  MessageModel(mensaje: "y tu como estas?", emisor: "idArles", receptor: "idHarry", leido: true),
  MessageModel(mensaje: "Bien de igual forma", emisor: "idHarry", receptor: "idArles", leido: true),

];

