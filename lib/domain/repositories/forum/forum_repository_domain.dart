import 'package:tesis_app/domain/entities/forum/forum_entitie.dart';
import 'package:tesis_app/domain/entities/forum/respuesta_forum.dart';

abstract class ForumRepositoryDomain {
  Future<bool> createForum(Forum forum);

  Future<List<Forum>> readAllForum();

  Future<Forum> readOneForum(String id);

  //Respuesta
  Future<bool> createRespuestaForum(RespuestaForo respuestaForo);
  
  Future<List<RespuestaForo>> readAllRespuestForum(String id);
}
