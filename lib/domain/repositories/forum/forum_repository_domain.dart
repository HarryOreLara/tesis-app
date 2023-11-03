import 'package:tesis_app/infraestructure/models/forum/forum_model.dart';
import 'package:tesis_app/infraestructure/models/forum/respuesta_forum_model.dart';

abstract class ForumRepositoryDomain {
  Future<bool> createForum(ForumModel forumModel);

  Future<List<ForumModel>> readAllForum();

  Future<ForumModel> readOneForum(String id);

  //Respuesta
  Future<bool> createRespuestaForum(RespuestaForoModel respuestaForo);
  
  Future<List<RespuestaForoModel>> readAllRespuestForum(String id);
}
