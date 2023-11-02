import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/datasources/messages/conversaciones_datasource_domain.dart';
import 'package:tesis_app/domain/datasources/profile/profile_datasource_domain.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/messages/conversaciones_datasource_infra.dart';
import 'package:tesis_app/infraestructure/datasources/profile/profile_datasource_infra.dart';
import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';

part 'conversaciones_event.dart';
part 'conversaciones_state.dart';

class ConversacionesBloc
    extends Bloc<ConversacionesEvent, ConversacionesState> {
  late ConversacionesDatasourceDomain _conversacionesDatasourceDomain;
  late ProfileDatasourceDomain _profileDatasourceDomain;

  ConversacionesBloc() : super(const ConversacionesState()) {
    _conversacionesDatasourceDomain = ConversacionesDatasourceInfra();
    _profileDatasourceDomain = ProfileDatasourceInfra();

    on<ConversacionesInit>((event, emit) {
      emit(state.copyWith(add: false, loading: false, error: ''));
    });

    on<GetAllConversaciones>((event, emit) async {
      final authService = AuthService();

      // final idPersonaNull = await authService.getPersonaId();
      // final idEmisor = idPersonaNull ?? '';
      //const idEmisor = '650cb7ee85491dc4f81be7f2';

      try {
        emit(state.copyWith(loading: true));
        final idUsuarioNull = await authService.getUserId();
        final idUsuario = idUsuarioNull ?? '';
        final idEmisor =
            await _profileDatasourceDomain.getOnePersona(idUsuario);
        final listConversaciones =
            await _conversacionesDatasourceDomain.allChats(idEmisor.id);
        emit(state.copyWith(
            loading: false, listConversaciones: listConversaciones));
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
