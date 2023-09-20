class Chats {
  final String idEmisor;
  final String idReceptor;
  final String nombreReceptor;
  final String nombreEmisor;

  Chats({required this.nombreEmisor, 
      required this.nombreReceptor,
      required this.idEmisor,
      required this.idReceptor});

  factory Chats.fromJson(Map<String, dynamic> json) => Chats(
      idEmisor: json["idEmisor"] ?? '',
      idReceptor: json["idReceptor"] ?? '',
      nombreEmisor: json["nombreEmisor"] ?? '',
      nombreReceptor: json["nombreReceptor"] ?? '');

  Map<String, dynamic> toJson() {
    return {
      "idEmisor": idEmisor,
      "idReceptor": idReceptor,
      "nombreReceptor": nombreReceptor,
      "nombreEmisor":nombreEmisor
    };
  }
}
