part of 'forum_bloc.dart';

abstract class ForumEvent extends Equatable {
  const ForumEvent();

  @override
  List<Object> get props => [];
}

class ForumInit extends ForumEvent {}

class GetOneForum extends ForumEvent {
  final String id;

  const GetOneForum({required this.id});
}

class GetAllForums extends ForumEvent {}

class CreateForum extends ForumEvent {
  final String titulo;
  final String descripcion;

  const CreateForum({required this.titulo, required this.descripcion});
}
