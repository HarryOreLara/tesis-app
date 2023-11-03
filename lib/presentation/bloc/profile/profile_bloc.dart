import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/datasources/profile/profile_datasource_domain.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/profile/profile_datasource_infra.dart';
import 'package:tesis_app/infraestructure/models/profile/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late ProfileDatasourceDomain _profileDatasourceDomain;

  ProfileBloc() : super(const ProfileState()) {
    _profileDatasourceDomain = ProfileDatasourceInfra();
    on<ProfileInit>((event, emit) {
      emit(state.copyWith(add: false, loading: false, error: ''));
    });

    on<SaveProfile>((event, emit) async {
      final authService = AuthService();
      try {
        emit(state.copyWith(loading: true));
        final idUsuarioNull = await authService.getUserId();
        final idUsuario = idUsuarioNull ?? '';

        ProfileModel profile = ProfileModel(
            idUsuario: idUsuario,
            id: "id",
            nombre: event.nombre,
            apellidos: event.apellidos,
            edad: event.edad,
            genero: event.genero,
            dni: event.dni);
        await _profileDatasourceDomain.postNewPersona(profile);
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

    on<CerrarSesion>((event, emit) {
      AuthService authService = AuthService();
      authService.clearUserCredentials();
    });
  }
}


