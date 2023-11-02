import 'dart:convert';
import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/conversaciones/conversaciones_entitie.dart';

class ConversacionesModel extends Conversaciones {
  const ConversacionesModel(
      {required super.idEmisor,
      required super.idReceptor,
      required super.nombreReceptor,
      required super.nombreEmisor});

  const ConversacionesModel.empty()
      : this(
            idEmisor: "1",
            idReceptor: "2",
            nombreEmisor: "Harry",
            nombreReceptor: "Myrian");

  factory ConversacionesModel.fromJson(String source) =>
      ConversacionesModel.fromMap(jsonDecode(source) as DataMap);

  ConversacionesModel.fromMap(DataMap map)
      : this(
            idEmisor: map["idEmisor"] as String,
            idReceptor: map["idReceptor"] as String,
            nombreEmisor: map["nombreEmisor"] as String,
            nombreReceptor: map["nombreReceptor"] as String);

  ConversacionesModel copyWith(
      {String? idEmisor,
      String? idReceptor,
      String? nombreEmisor,
      String? nombreReceptor}) {
    return ConversacionesModel(
        idEmisor: idEmisor ?? this.idEmisor,
        idReceptor: idReceptor ?? this.idReceptor,
        nombreEmisor: nombreEmisor ?? this.nombreEmisor,
        nombreReceptor: nombreReceptor ?? this.nombreReceptor);
  }

  DataMap toMap() => {
        "idReceptor": idReceptor,
        "idEmisor": idEmisor,
        "nombreEmisor": nombreEmisor,
        "nombreReceptor": nombreReceptor
      };
  String toJson() => jsonEncode(toMap());
}
