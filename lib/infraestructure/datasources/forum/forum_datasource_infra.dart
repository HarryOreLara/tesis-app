import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/forum/forum_datasource_domain.dart';
import 'package:tesis_app/domain/entities/forum/forum_entitie.dart';
import 'package:tesis_app/domain/entities/forum/respuesta_forum.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/mappers/forum_mapper.dart';
import 'package:tesis_app/infraestructure/mappers/respuesta_foro_mapper.dart';
import 'package:tesis_app/infraestructure/models/forum/forum_response.dart';
import 'package:tesis_app/infraestructure/models/forum/response_reponse.dart';
import 'package:tesis_app/infraestructure/models/forum/respuesta_forum_response.dart';

class ForumDatasourceInfra extends ForumDatasourceDomain {
  AuthService authService = AuthService();

  Dio nuevo(String token) {
    return Dio(BaseOptions(
        baseUrl: 'https://tesis-xz3b.onrender.com',
        headers: {'Content-Type': 'application/json', 'x-auth-token': token}));
  }

  @override
  Future<bool> createForum(Forum forum) async {
    final tokenNull = await authService.getToken();
    final token = tokenNull ?? '';

    try {
      final forumJson = forum.toJson();
      final response =
          await nuevo(token).post('/forum/create', data: forumJson);
      final res = ForumResponse.fromJson(response.data);
      return res.ok;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> createRespuestaForum(RespuestaForo respuestaForo) async {
    final tokenNull = await authService.getToken();
    final token = tokenNull ?? '';

    final respuestaJson = respuestaForo.toJson();
    final idForo = respuestaForo.idForo;

    final response = await nuevo(token)
        .post("/responseForum/create/$idForo", data: respuestaJson);
    final res = ResponseReponse.fromJson(response.data);

    return res.ok;
  }

  @override
  Future<List<Forum>> readAllForum() async {
    final tokenNull = await authService.getToken();
    final token = tokenNull ?? '';
    final response = await nuevo(token).get('/forum/readAll');
    final res = ForumResponse.fromJson(response.data);
    final List<Forum> foros = res.foro
        .map((forumDb) => ForumMapper.forumDbToEntity(forumDb))
        .toList();
    return foros;
  }

  @override
  Future<List<RespuestaForo>> readAllRespuestForum(String id) async {
    final tokenNull = await authService.getToken();
    final token = tokenNull ?? '';
    final response = await nuevo(token).get('/responseForum/readAll/$id');
    final res = RespuestaForumReponse.fromJson(response.data);
    final List<RespuestaForo> foros = res.foro
        .map((forumDb) => RespuestaForoMapper.respuestaForoToEntity(forumDb))
        .toList();
    return foros;
  }

  @override
  Future<Forum> readOneForum(String id) {
    throw UnimplementedError();
  }
}
