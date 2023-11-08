import 'dart:convert';

import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/medicines/medicine_marcacion_entitite.dart';

class MedicineMarcacionModel extends MedicineMarcacion {
  const MedicineMarcacionModel(
      {required super.nombre,
      required super.idMedicine,
      required super.creator,
      required super.createdAt});

  const MedicineMarcacionModel.empty()
      : this(
            nombre: "_empty_nombre",
            idMedicine: "1",
            creator: "_empty_creator",
            createdAt: "_empty_createdAt");

  factory MedicineMarcacionModel.fromjson(String source) =>
      MedicineMarcacionModel.fromMap(jsonDecode(source) as DataMap);

  MedicineMarcacionModel.fromMap(DataMap map)
      : this(
            nombre: map['nombre'] as String,
            idMedicine: map['idMedicine'] as String,
            creator: map['creator'] as String,
            createdAt: map['createdAt'] as String);

  MedicineMarcacionModel copyWith(
      {String? nombre,
      String? idMedicine,
      String? creator,
      String? createdAt}) {
    return MedicineMarcacionModel(
        nombre: nombre ?? this.nombre,
        idMedicine: idMedicine ?? this.idMedicine,
        creator: creator ?? this.creator,
        createdAt: createdAt ?? this.createdAt);
  }

  DataMap toMap() => {
        "nombre": nombre,
        "idMedicine": idMedicine,
        "creator": creator,
        "createdAt": createdAt
      };

  String toJson() => jsonEncode(toMap());
}
