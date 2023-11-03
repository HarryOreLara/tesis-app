part of 'forum_bloc.dart';

class ForumState extends Equatable {
  final bool loading;
  final String error;
  final bool add;
  final List<ForumModel> listForum;
  final List<RespuestaForo> listRespuestaForo;

  const ForumState(
      {this.loading = false,
      this.error = '',
      this.add = false,
      this.listForum = const [],
      this.listRespuestaForo = const []});

  ForumState copyWith(
          {bool? loading,
          String? error,
          bool? add,
          List<ForumModel>? listForum,
          List<RespuestaForo>? listRespuestaForo}) =>
      ForumState(
          loading: loading ?? this.loading,
          error: error ?? this.error,
          add: add ?? this.add,
          listForum: listForum ?? this.listForum,
          listRespuestaForo: listRespuestaForo ?? this.listRespuestaForo);

  @override
  List<Object> get props => [loading, error, add, listForum, listRespuestaForo];
}

final class ForumInitial extends ForumState {}
