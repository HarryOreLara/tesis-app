import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/forum/forum_entitie.dart';
import 'package:meta/meta.dart';
import 'package:tesis_app/infraestructure/datasources/forum/forum_datasource_infra.dart';
import 'package:tesis_app/infraestructure/repositories/forum/forum_repository_infra.dart';

part 'forum_event.dart';
part 'forum_state.dart';

class ForumBloc extends Bloc<ForumEvent, ForumState> {
  ForumRepositoryInfra forumRepositoryInfra =
      ForumRepositoryInfra(ForumDatasourceInfra());

  ForumBloc() : super(const ForumInitialState()) {
    on<LoadForums>((event, emit) async {
      try {
        final forums = await forumRepositoryInfra.readAllForum();
        emit(ForumLoaded(forums));
      } catch (e) {
        emit(ForumError(e.toString()));
      }
    });

    on<AddForum>((event, emit) async {
      final success = await forumRepositoryInfra.createForum(event.newForum);
      if (success) {
        // Si se creó el foro con éxito, emitir un evento para cargar la lista actualizada
        add(LoadForums());
      } else {
        // Manejar el caso en el que no se pudo crear el foro
        emit(ForumError('No se pudo crear el foro.'));
      }
    });
  }
}
