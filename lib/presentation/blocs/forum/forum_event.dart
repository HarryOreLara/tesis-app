part of 'forum_bloc.dart';

@immutable
abstract class ForumEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddForum extends ForumEvent {
  final Forum newForum;
  AddForum(this.newForum);

  @override
  List<Object> get props => [newForum];
}

class LoadForums extends ForumEvent {}
