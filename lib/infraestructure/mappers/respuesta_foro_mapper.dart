import 'package:tesis_app/infraestructure/models/forum/respuesta_forum_model.dart';

class RespuestaForoMapper {
  static RespuestaForoModel respuestaForoToEntity(RespuestaForoModel respuestaForo) =>
      RespuestaForoModel(
          id: respuestaForo.id,
          contenido: respuestaForo.contenido,
          creador: respuestaForo.creador,
          idForo: respuestaForo.idForo,
          createdAt: respuestaForo.createdAt);
}
