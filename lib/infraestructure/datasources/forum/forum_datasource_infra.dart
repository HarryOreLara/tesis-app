import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/forum/forum_datasource_domain.dart';
import 'package:tesis_app/domain/entities/forum/forum_entitie.dart';
import 'package:tesis_app/domain/entities/forum/respuesta_forum.dart';

class ForumDatasourceInfra extends ForumDatasourceDomain {



  final dio =
      Dio(BaseOptions(baseUrl: 'https://tesis-xz3b.onrender.com', headers: {
    'Content-Type': 'application/json',
    'x-auth-token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTJhNjgxMWUzNTBkOWIxYzFjMmZhZSIsImlhdCI6MTY5MjU3NTM2MX0.5rES-UtmnEAJZonUqPQ9cHll30wsNSY8zUVzIqXn5zo'
  }));



  @override
  Future<Forum> createForum(Forum forum) {
    // TODO: implement createForum
    throw UnimplementedError();
  }

  @override
  Future<RespuestaForo> createRespuestaForum(RespuestaForo respuestaForo) {
    // TODO: implement createRespuestaForum
    throw UnimplementedError();
  }

  @override
  Future<List<Forum>> readAllForum() {
    // TODO: implement readAllForum
    throw UnimplementedError();
  }

  @override
  Future<List<RespuestaForo>> readAllRespuestForum(String id) {
    // TODO: implement readAllRespuestForum
    throw UnimplementedError();
  }

  @override
  Future<Forum> readOneForum(String id) {
    // TODO: implement readOneForum
    throw UnimplementedError();
  }
}
