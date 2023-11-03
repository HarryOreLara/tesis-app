part of 'forum_bloc.dart';

abstract class ForumEvent extends Equatable {
  const ForumEvent();

  @override
  List<Object> get props => [];
}

class ForumInit extends ForumEvent {}

class GetAllRespuestasByForum extends ForumEvent {
  final String id;

  const GetAllRespuestasByForum({required this.id});
}

class GetAllForums extends ForumEvent {}

class CreateForum extends ForumEvent {
  final String titulo;
  final String descripcion;

  const CreateForum({required this.titulo, required this.descripcion});
}

class SendRespuesta extends ForumEvent {
  final String id;
  final String respuesta;

  const SendRespuesta({required this.respuesta, required this.id});
}
