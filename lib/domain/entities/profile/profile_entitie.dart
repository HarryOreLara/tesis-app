import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String nombre;
  final String apellidos;
  final String edad;
  final String genero;
  final String dni;
  final String idUsuario;

  const Profile(
      {required this.idUsuario,
      required this.id,
      required this.nombre,
      required this.apellidos,
      required this.edad,
      required this.genero,
      required this.dni});

  @override
  List<Object?> get props =>
      [id, nombre, apellidos, edad, genero, dni, idUsuario];
}
