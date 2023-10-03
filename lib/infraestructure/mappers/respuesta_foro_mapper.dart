import 'package:tesis_app/domain/entities/forum/respuesta_forum.dart';

class RespuestaForoMapper {
  static RespuestaForo respuestaForoToEntity(RespuestaForo respuestaForo) =>
      RespuestaForo(
          contenido: respuestaForo.contenido,
          id: respuestaForo.id,
          creator: respuestaForo.creator,
          idForo: respuestaForo.idForo,
          createdAt: respuestaForo.createdAt);
}
