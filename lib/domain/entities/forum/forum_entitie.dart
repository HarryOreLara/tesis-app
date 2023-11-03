import 'package:equatable/equatable.dart';

class Forum extends Equatable {
  final String id;
  final String titulo;
  final String descripcion;
  final String creator;
  final String createdAt;

  const Forum.empty()
      : this(
            id: "1",
            titulo: "_empty_titulo",
            descripcion: "_empty_descripcion",
            creator: "_empty_creator",
            createdAt: "_empty_createdAt");

  const Forum(
      {required this.id,
      required this.titulo,
      required this.descripcion,
      required this.creator,
      required this.createdAt});


  @override
  List<Object?> get props => [id, titulo, descripcion, creator, createdAt];
}
