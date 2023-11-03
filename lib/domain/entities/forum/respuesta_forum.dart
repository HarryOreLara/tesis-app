import 'package:equatable/equatable.dart';

class RespuestaForo extends Equatable {
  final String id;
  final String creador;
  final String contenido;
  final String idForo;
  final String createdAt;

  const RespuestaForo.empty() : this(
    id:"1",
    creador: "_empty_creador",
    contenido: "_empty_contenido",
    idForo: "1",
    createdAt: "_empty_createdAt"
  );

  const RespuestaForo(
      {required this.contenido,
      required this.id,
      required this.creador,
      required this.idForo,
      required this.createdAt});


  @override
  List<Object?> get props => [id, creador, contenido, idForo, createdAt];
}
