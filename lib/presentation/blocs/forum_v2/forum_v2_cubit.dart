import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/forum/forum_entitie.dart';
import 'package:tesis_app/domain/entities/forum/respuesta_forum.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/forum/forum_datasource_infra.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/forum/description_input.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/forum/title_input.dart';
import 'package:tesis_app/infraestructure/mappers/forum_mapper.dart';
import 'package:tesis_app/infraestructure/repositories/forum/forum_repository_infra.dart';

part 'forum_v2_state.dart';

class ForumV2Cubit extends Cubit<ForumV2State> {
  ForumRepositoryInfra forumRepositoryInfra =
      ForumRepositoryInfra(ForumDatasourceInfra());

  AuthService authService = AuthService();

  ForumV2Cubit() : super(ForumV2Initial());

  Future<List<Forum>> readAllForums() async {
    final response = await forumRepositoryInfra.readAllForum();
    final List<Forum> myLista =
        response.map((e) => ForumMapper.forumDbToEntity(e)).toList();
    return myLista;
  }

  Future<bool> createForum(String titulo, String descripcion) async {
    final idPersonaNull = await authService.getPersonaId();
    final creator = idPersonaNull ?? '';
    final forum = Forum(
        id: "id",
        titulo: titulo,
        descripcion: descripcion,
        creator: creator,
        createdAt: "createdAt");
    final response = await forumRepositoryInfra.createForum(forum);
    if (response) {
      final updateForums = await readAllForums();
      emit(state.copyWith(forums: updateForums));
    }
    return response;
  }



  

  Future<List<RespuestaForo>> readAllRespuestas(String id) async {
    final response = await forumRepositoryInfra.readAllRespuestForum(id);
    return response;
  }

  void sendResponse(String idForo) async {
    final idPersonaNull = await authService.getPersonaId();
    final creator = idPersonaNull ?? '';
    final respuestaForo = RespuestaForo(
        contenido: state.descriptionForum.value,
        id: "",
        creator: creator,
        idForo: idForo,
        createdAt: "");
    forumRepositoryInfra.createRespuestaForum(respuestaForo);
  }


}
