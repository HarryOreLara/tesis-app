import 'package:tesis_app/domain/entities/forum/respuesta_forum.dart';
import 'package:tesis_app/infraestructure/models/forum/forum_model.dart';

abstract class ForumRepositoryDomain {
  Future<bool> createForum(ForumModel forumModel);

  Future<List<ForumModel>> readAllForum();

  Future<ForumModel> readOneForum(String id);

  //Respuesta
  Future<bool> createRespuestaForum(RespuestaForo respuestaForo);
  
  Future<List<RespuestaForo>> readAllRespuestForum(String id);
}
