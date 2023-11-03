import 'package:tesis_app/domain/datasources/forum/forum_datasource_domain.dart';
import 'package:tesis_app/domain/repositories/forum/forum_repository_domain.dart';
import 'package:tesis_app/infraestructure/models/forum/forum_model.dart';
import 'package:tesis_app/infraestructure/models/forum/respuesta_forum_model.dart';

class ForumRepositoryInfra extends ForumRepositoryDomain {
  final ForumDatasourceDomain forumDatasourceDomain;

  ForumRepositoryInfra(this.forumDatasourceDomain);

  @override
  Future<bool> createForum(ForumModel forumModel) {
    return forumDatasourceDomain.createForum(forumModel);
  }

  @override
  Future<bool> createRespuestaForum(RespuestaForoModel respuestaForo) {
    return forumDatasourceDomain.createRespuestaForum(respuestaForo);
  }

  @override
  Future<List<ForumModel>> readAllForum() {
    return forumDatasourceDomain.readAllForum();
  }

  @override
  Future<List<RespuestaForoModel>> readAllRespuestForum(String id) {
    return forumDatasourceDomain.readAllRespuestForum(id);
  }

  @override
  Future<ForumModel> readOneForum(String id) {
    return forumDatasourceDomain.readOneForum(id);
  }
}
