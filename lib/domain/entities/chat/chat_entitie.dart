import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final String id;
  final String emisor;
  final String receptor;
  final String mensaje;
  final bool leido;
  final String tiempo;

  const Chat.empty()
      : this(
            id: "1",
            emisor: "1",
            receptor: "2",
            mensaje: "_empty_mensaje",
            leido: true,
            tiempo: "2023-11-02 08:28:00");

  const Chat(
      {required this.id,
      required this.mensaje,
      required this.leido,
      required this.tiempo,
      required this.emisor,
      required this.receptor});

  @override
  List<Object?> get props => [id, mensaje, leido, tiempo, emisor, receptor];
}
