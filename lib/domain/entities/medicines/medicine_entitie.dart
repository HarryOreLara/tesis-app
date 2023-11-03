import 'package:equatable/equatable.dart';

class Medicine extends Equatable {
  final String id;
  final String nombre;
  final String cantidadMedicamentos;
  final String horaInicio;
  final String horaIntermedio;
  final String horaFin;

  const Medicine.empty()
      : this(
            id: "1",
            nombre: "_empty_dni",
            cantidadMedicamentos: "1",
            horaInicio: "00:00",
            horaIntermedio: "00:00",
            horaFin: "00:00");

  const Medicine({
    required this.id,
    required this.nombre,
    required this.cantidadMedicamentos,
    required this.horaInicio,
    required this.horaIntermedio,
    required this.horaFin,
  });


  @override
  List<Object?> get props =>
      [id, nombre, cantidadMedicamentos, horaInicio, horaIntermedio, horaFin];
}
