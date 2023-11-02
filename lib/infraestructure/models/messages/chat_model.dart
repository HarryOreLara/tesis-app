import 'dart:convert';

import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/chat/chat_entitie.dart';

class ChatModel extends Chat {
  const ChatModel(
      {required super.id,
      required super.mensaje,
      required super.leido,
      required super.tiempo,
      required super.emisor,
      required super.receptor});

  const ChatModel.empty()
      : this(
            id: "1",
            emisor: "1",
            receptor: "2",
            mensaje: "_empty_mensaje",
            leido: true,
            tiempo: "2023-11-02 08:28:00");

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(jsonDecode(source) as DataMap);

  ChatModel.fromMap(DataMap map)
      : this(
            id: map["_id"] as String,
            emisor: map["emisor"] as String,
            receptor: map["receptor"] as String,
            mensaje: map["mensaje"] as String,
            leido: map["leido"] as bool,
            tiempo: map["createdAt"] as String);

  ChatModel copyWith(
      {String? id,
      String? emisor,
      String? receptor,
      String? mensaje,
      bool? leido,
      String? tiempo}) {
    return ChatModel(
        id: id ?? this.id,
        emisor: emisor ?? this.emisor,
        receptor: receptor ?? this.receptor,
        mensaje: mensaje ?? this.mensaje,
        leido: leido ?? this.leido,
        tiempo: tiempo ?? this.tiempo);
  }

  DataMap toMap() => {
        "emisor": emisor,
        "receptor": receptor,
        "mensaje": mensaje,
        "leido": leido,
        "tiempo": tiempo
      };

  String toJson() => jsonEncode(toMap());
}
