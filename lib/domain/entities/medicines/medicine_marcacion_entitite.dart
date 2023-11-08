import 'package:equatable/equatable.dart';

class MedicineMarcacion extends Equatable {
  final String nombre;
  final String idMedicine;
  final String creator;
  final String createdAt;

  const MedicineMarcacion.empty()
      : this(
            nombre: "_empty_nombre",
            idMedicine: "1",
            creator: "_empty_creator",
            createdAt: "_empty_createdAt");

  const MedicineMarcacion(
      {required this.nombre,
      required this.idMedicine,
      required this.creator,
      required this.createdAt});

  @override
  List<Object?> get props => [nombre, idMedicine, creator, createdAt];
}
