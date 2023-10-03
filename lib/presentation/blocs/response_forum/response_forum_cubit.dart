import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/forum/respuesta_forum.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/forum/forum_datasource_infra.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';
import 'package:tesis_app/infraestructure/repositories/forum/forum_repository_infra.dart';

part 'response_forum_state.dart';

class ResponseForumCubit extends Cubit<ResponseForumState> {
  ForumRepositoryInfra forumRepositoryInfra =
      ForumRepositoryInfra(ForumDatasourceInfra());
  ResponseForumCubit() : super(ResponseForumInitial());
  AuthService authService = AuthService();

  Future<List<RespuestaForo>> readAllRespuestas(String id) async {
    final response = await forumRepositoryInfra.readAllRespuestForum(id);
    return response;
  }

  void sendRespuesta(String contenido, String idForo) async {
    final idPersonaNull = await authService.getPersonaId();
    final creator = idPersonaNull ?? '';
    final respuestaForo = RespuestaForo(
        contenido: contenido,
        id: "id",
        creator: creator,
        idForo: idForo,
        createdAt: "createdAt");
    final response =
        await forumRepositoryInfra.createRespuestaForum(respuestaForo);
    if (response) {
      final updateRespuestas = await readAllRespuestas(idForo);
      emit(state.copyWith(respForoList: updateRespuestas));
    }
  }
}
