import 'dart:convert';
import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/conversaciones/conversaciones_entitie.dart';

class ConversacionesModel extends Conversaciones {
  const ConversacionesModel(
      {required super.id,
      required super.idEmisor,
      required super.idReceptor,
      required super.nombreReceptor,
      required super.nombreEmisor,
      required super.createdAt});

  const ConversacionesModel.empty()
      : this(
            id: "1",
            idEmisor: "1",
            idReceptor: "2",
            nombreEmisor: "Harry",
            nombreReceptor: "Myrian",
            createdAt: "_empty_createdAt");

  factory ConversacionesModel.fromJson(String source) =>
      ConversacionesModel.fromMap(jsonDecode(source) as DataMap);

  ConversacionesModel.fromMap(DataMap map)
      : this(
            id: map["_id"] as String,
            idEmisor: map["idEmisor"] as String,
            idReceptor: map["idReceptor"] as String,
            nombreEmisor: map["nombreEmisor"] as String,
            nombreReceptor: map["nombreReceptor"] as String,
            createdAt: map["createdAt"] as String);

  ConversacionesModel copyWith(
      {String? id,
      String? idEmisor,
      String? idReceptor,
      String? nombreEmisor,
      String? nombreReceptor,
      String? createdAt}) {
    return ConversacionesModel(
        id: id ?? this.id,
        idEmisor: idEmisor ?? this.idEmisor,
        idReceptor: idReceptor ?? this.idReceptor,
        nombreEmisor: nombreEmisor ?? this.nombreEmisor,
        nombreReceptor: nombreReceptor ?? this.nombreReceptor,
        createdAt: createdAt ?? this.createdAt);
  }

  DataMap toMap() => {
        "_id": id,
        "idEmisor": idEmisor,
        "idReceptor": idReceptor,
        "nombreEmisor": nombreEmisor,
        "nombreReceptor": nombreReceptor,
        "createdAt": createdAt
      };
  String toJson() => jsonEncode(toMap());
}
