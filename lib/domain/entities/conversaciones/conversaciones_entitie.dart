import 'package:equatable/equatable.dart';

class Conversaciones extends Equatable {
  final String idEmisor;
  final String idReceptor;
  final String nombreReceptor;
  final String nombreEmisor;

  const Conversaciones.empty()
      : this(
            idEmisor: "1",
            idReceptor: "2",
            nombreEmisor: "Harry",
            nombreReceptor: "Myrian");

  const Conversaciones(
      {required this.idEmisor,
      required this.idReceptor,
      required this.nombreReceptor,
      required this.nombreEmisor});

  @override
  List<Object?> get props => [idEmisor, idReceptor, nombreEmisor, nombreReceptor];
}
