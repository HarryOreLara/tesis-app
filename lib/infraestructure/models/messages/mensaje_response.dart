import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/infraestructure/models/messages/chat_model.dart';

class MensajeResponse {
  final bool ok;
  final List<ChatModel> mensajeList;

  MensajeResponse({required this.ok, required this.mensajeList});

  factory MensajeResponse.fromJson(DataMap json) => MensajeResponse(
      ok: json['ok'] ?? '',
      mensajeList: (json["mensajeList"] as List<dynamic>?)
              ?.map((x) => ChatModel.fromMap(x))
              .toList() ??
          []);

  Map<String, dynamic> toJson() => {"ok": ok, "mensajeList": mensajeList};
}
