part of 'forum_bloc.dart';

sealed class ForumState extends Equatable {
  final Forum? forum;

  const ForumState({this.forum});

  @override
  List<Object> get props => [];
}

final class ForumInitialState extends ForumState {
  const ForumInitialState() : super(forum: null);
}

class ForumSetState extends ForumState {
  final Forum newForum;
  const ForumSetState(this.newForum) : super(forum: newForum);
}
