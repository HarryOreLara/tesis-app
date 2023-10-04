import 'package:tesis_app/domain/datasources/forum/forum_datasource_domain.dart';
import 'package:tesis_app/domain/entities/forum/forum_entitie.dart';
import 'package:tesis_app/domain/entities/forum/respuesta_forum.dart';
import 'package:tesis_app/domain/repositories/forum/forum_repository_domain.dart';

class ForumRepositoryInfra extends ForumRepositoryDomain {
  final ForumDatasourceDomain forumDatasourceDomain;

  ForumRepositoryInfra(this.forumDatasourceDomain);

  @override
  Future<bool> createForum(Forum forum) {
    return forumDatasourceDomain.createForum(forum);
  }

  @override
  Future<bool> createRespuestaForum(RespuestaForo respuestaForo) {
    return forumDatasourceDomain.createRespuestaForum(respuestaForo);
  }

  @override
  Future<List<Forum>> readAllForum() {
    return forumDatasourceDomain.readAllForum();
  }

  @override
  Future<List<RespuestaForo>> readAllRespuestForum(String id) {
    return forumDatasourceDomain.readAllRespuestForum(id);
  }

  @override
  Future<Forum> readOneForum(String id) {
    return forumDatasourceDomain.readOneForum(id);
  }
}
