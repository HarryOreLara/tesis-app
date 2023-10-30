import 'dart:convert';

import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';

class MedicineModel extends Medicine {
  const MedicineModel(
      {required super.id,
      required super.nombre,
      required super.cantidadMedicamentos,
      required super.horaInicio,
      required super.horaIntermedio,
      required super.horaFin});

  const MedicineModel.empty()
      : this(
            id: "1",
            nombre: "_empty_dni",
            cantidadMedicamentos: "1",
            horaInicio: "00:00",
            horaIntermedio: "00:00",
            horaFin: "00:00");

  factory MedicineModel.fromJson(String source) =>
      MedicineModel.fromMap(jsonDecode(source) as DataMap);

  MedicineModel.fromMap(DataMap map)
      : this(
          id: map["_id"] as String,
          nombre: map["nombre"] as String,
          cantidadMedicamentos: map["cantidadMedicamentos"] as String,
          horaInicio: map["horaInicio"] as String,
          horaIntermedio: map["horaIntermedio"] as String,
          horaFin: map["horaFin"] as String,
        );

  MedicineModel copyWith(
      {String? id,
      String? nombre,
      String? cantidadMedicamentos,
      String? horaInicio,
      String? horaIntermedio,
      String? horaFin}) {
    return MedicineModel(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        cantidadMedicamentos: cantidadMedicamentos ?? this.cantidadMedicamentos,
        horaInicio: horaInicio ?? this.horaInicio,
        horaIntermedio: horaIntermedio ?? this.horaIntermedio,
        horaFin: horaFin ?? this.horaFin);
  }

  DataMap toMap() => {
        "nombre": nombre,
        "cantidadMedicamentos": cantidadMedicamentos,
        "horaInicio": horaInicio,
        "horaIntermedio": horaIntermedio,
        "horaFin": horaFin
      };

  String toJson() => jsonEncode(toMap());
}
