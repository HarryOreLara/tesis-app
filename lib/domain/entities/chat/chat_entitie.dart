import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final String id;
  final String emisor;
  final String receptor;
  final String mensaje;
  final bool leido;
  final String createdAt;

  const Chat.empty()
      : this(
            id: "1",
            emisor: "1",
            receptor: "2",
            mensaje: "_empty_mensaje",
            leido: true,
            createdAt: "2023-11-02 08:28:00");

  const Chat(
      {required this.id,
      required this.mensaje,
      required this.leido,
      required this.createdAt,
      required this.emisor,
      required this.receptor});

  @override
  List<Object?> get props => [id, mensaje, leido, createdAt, emisor, receptor];
}
