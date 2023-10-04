part of 'response_forum_cubit.dart';

class ResponseForumState extends Equatable {
  final ContenidoRespuestaForum contenido;
  final List<RespuestaForo> respForoList;
  const ResponseForumState(
      {this.contenido = const ContenidoRespuestaForum.pure(),
      this.respForoList = const []});

  ResponseForumState copyWith(
          {ContenidoRespuestaForum? contenido,
          List<RespuestaForo>? respForoList}) =>
      ResponseForumState(
          contenido: contenido ?? this.contenido,
          respForoList: respForoList ?? this.respForoList);

  @override
  List<Object> get props => [contenido, respForoList];
}

final class ResponseForumInitial extends ResponseForumState {}
