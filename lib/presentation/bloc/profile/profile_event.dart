part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInit extends ProfileEvent {}

class SaveProfile extends ProfileEvent {
  final String nombre;
  final String apellidos;
  final String edad;
  final String genero;
  final String dni;

  const SaveProfile(
      {required this.nombre,
      required this.apellidos,
      required this.edad,
      required this.genero,
      required this.dni});
}

class CerrarSesion extends ProfileEvent {}
