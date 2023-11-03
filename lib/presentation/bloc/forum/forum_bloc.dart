import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/datasources/forum/forum_datasource_domain.dart';
import 'package:tesis_app/domain/datasources/profile/profile_datasource_domain.dart';
import 'package:tesis_app/domain/entities/forum/respuesta_forum.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/forum/forum_datasource_infra.dart';
import 'package:tesis_app/infraestructure/datasources/profile/profile_datasource_infra.dart';
import 'package:tesis_app/infraestructure/models/forum/forum_model.dart';

part 'forum_event.dart';
part 'forum_state.dart';

class ForumBloc extends Bloc<ForumEvent, ForumState> {
  late ForumDatasourceDomain _forumDatasourceDomain;
  late ProfileDatasourceDomain _profileDatasourceDomain;

  ForumBloc() : super(const ForumState()) {
    _forumDatasourceDomain = ForumDatasourceInfra();
    _profileDatasourceDomain = ProfileDatasourceInfra();

    on<ForumInit>((event, emit) {
      emit(state.copyWith(add: false, loading: false, error: ''));
    });

    on<GetAllForums>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final listForum = await _forumDatasourceDomain.readAllForum();
        emit(state.copyWith(loading: false, listForum: listForum));
      } catch (e) {
        try {
          emit(
              state.copyWith(loading: false, error: (e as dynamic)['message']));
        } catch (e) {
          emit(state.copyWith(
              loading: false, error: 'Ocurrio un error de segundo nivel'));
        }
      }
    });

    on<GetOneForum>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));

        final listRespuestaForo =
            await _forumDatasourceDomain.readAllRespuestForum(event.id);
        emit(state.copyWith(
            loading: false, listRespuestaForo: listRespuestaForo));
      } catch (e) {
        try {
          emit(
              state.copyWith(loading: false, error: (e as dynamic)['message']));
        } catch (e) {
          emit(state.copyWith(
              loading: false, error: 'Ocurrio un error de segundo nivel'));
        }
      }
    });

    on<CreateForum>((event, emit) async {
      final authService = AuthService();

      try {
        emit(state.copyWith(loading: true));
        final idUsuarioNull = await authService.getUserId();
        final idUsuario = idUsuarioNull ?? '';
        final creator = await _profileDatasourceDomain.getOnePersona(idUsuario);

        final forum = ForumModel(
            id: "id",
            titulo: event.titulo,
            descripcion: event.descripcion,
            creator: creator.id,
            createdAt: "createdAt");

        await _forumDatasourceDomain.createForum(forum);
        emit(state.copyWith(loading: false, add: true));
      } catch (e) {
        try {
          emit(
              state.copyWith(loading: false, error: (e as dynamic)['message']));
        } catch (e) {
          emit(state.copyWith(
              loading: false, error: 'Ocurrio un error de segundo nivel'));
        }
      }
    });
  }
}
