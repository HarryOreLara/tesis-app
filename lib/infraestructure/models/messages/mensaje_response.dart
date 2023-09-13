import 'package:tesis_app/infraestructure/models/messages/message_model.dart';

class MensajeResponse {
  final bool ok;
  final List<MessageModel> mensajeList;

  MensajeResponse({required this.ok, required this.mensajeList});

  factory MensajeResponse.fromJson(Map<String, dynamic> json) =>
      MensajeResponse(
          ok: json['ok'] ?? '',
          mensajeList: (json["mensajeList"] as List<dynamic>?)
                  ?.map((x) => MessageModel.fromJson(x))
                  .toList() ??
              []);

  Map<String, dynamic> toJson() => {"ok": ok, "mensajeList": mensajeList};
}
