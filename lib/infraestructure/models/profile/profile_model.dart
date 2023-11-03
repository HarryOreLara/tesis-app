import 'dart:convert';
import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';

class ProfileModel extends Profile {
  const ProfileModel(
      {required super.idUsuario,
      required super.id,
      required super.nombre,
      required super.apellidos,
      required super.edad,
      required super.genero,
      required super.dni});

  const ProfileModel.empty()
      : this(
            idUsuario: "1",
            id: "1",
            nombre: "_empty_nombre",
            apellidos: "_empty_appelidos",
            edad: "_empty_edad",
            genero: "_empty_genero",
            dni: "_empty_dni");

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(jsonDecode(source) as DataMap);

  ProfileModel.fromMap(DataMap map)
      : this(
            id: map["_id"] as String,
            nombre: map["nombre"] as String,
            apellidos: map["apellidos"] as String,
            edad: map["edad"] as String,
            genero: map["genero"] as String,
            dni: map["dni"] as String,
            idUsuario: map["idUsuario"] as String);

  ProfileModel copyWith(
      {String? idUsuario,
      String? id,
      String? nombre,
      String? apellidos,
      String? edad,
      String? genero,
      String? dni}) {
    return ProfileModel(
        idUsuario: idUsuario ?? this.idUsuario,
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        apellidos: apellidos ?? this.apellidos,
        edad: edad ?? this.edad,
        genero: genero ?? this.genero,
        dni: dni ?? this.dni);
  }

  DataMap toMap() => {
        "_id": id,
        'nombre': nombre,
        'apellidos': apellidos,
        'edad': edad,
        'genero': genero,
        'dni': dni,
        'idUsuario': idUsuario
      };

  String toJson() => jsonEncode(toMap());
}
