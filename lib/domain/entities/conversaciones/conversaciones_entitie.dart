import 'package:equatable/equatable.dart';

class Conversaciones extends Equatable {
  final String id;
  final String idEmisor;
  final String idReceptor;
  final String nombreReceptor;
  final String nombreEmisor;
  final String createdAt;

  const Conversaciones.empty()
      : this(
            id: "1",
            idEmisor: "1",
            idReceptor: "2",
            nombreEmisor: "Harry",
            nombreReceptor: "Myrian",
            createdAt: "_empty_createdAt");

  const Conversaciones(
      {required this.id,
      required this.idEmisor,
      required this.idReceptor,
      required this.nombreReceptor,
      required this.nombreEmisor,
      required this.createdAt});

  @override
  List<Object?> get props =>
      [id, idEmisor, idReceptor, nombreEmisor, nombreReceptor, createdAt];
}
