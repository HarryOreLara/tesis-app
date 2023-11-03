import 'dart:convert';

import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/forum/respuesta_forum.dart';

class RespuestaForoModel extends RespuestaForo {
  const RespuestaForoModel(
      {required super.id,
      required super.creador,
      required super.contenido,
      required super.idForo,
      required super.createdAt});

  const RespuestaForoModel.empty()
      : this(
            id: "1",
            creador: "_empty_creador",
            contenido: "_empty_contenido",
            idForo: "1",
            createdAt: "_empty_createdAt");

  factory RespuestaForoModel.fromJson(String source) =>
      RespuestaForoModel.fromMap(jsonDecode(source) as DataMap);

  RespuestaForoModel.fromMap(DataMap map)
      : this(
            id: map["_id"] as String,
            creador: map["creador"] as String,
            contenido: map["contenido"] as String,
            idForo: map["idForo"] as String,
            createdAt: map["createdAt"] as String);

  RespuestaForoModel copyWith(
      {String? id,
      String? creador,
      String? contenido,
      String? idForo,
      String? createdAt}) {
    return RespuestaForoModel(
        id: id ?? this.id,
        creador: creador ?? this.creador,
        contenido: contenido ?? this.contenido,
        idForo: idForo ?? this.idForo,
        createdAt: createdAt ?? this.createdAt);
  }

  DataMap toMap() => {
        "_id": id,
        "creador": creador,
        "contenido": contenido,
        "idForo": idForo,
        "createdAt": createdAt
      };

  String toJson() => jsonEncode(toMap());
}
