import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/datasources/auth/login_datasource_domain.dart';
import 'package:tesis_app/domain/datasources/auth/register_datasourcer_domain.dart';
import 'package:tesis_app/domain/entities/auth/usuario_entitie.dart';
import 'package:tesis_app/infraestructure/datasources/auth/login_datasource_infra.dart';
import 'package:tesis_app/infraestructure/datasources/auth/register_datasource_infra.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late LoginDatasouceDomain _loginDatasouceDomain;
  late RegisterDatasourceDomain _registerDatasourceDomain;
  LoginBloc() : super(const LoginState()) {
    _loginDatasouceDomain = LoginDatasouceInfra();
    _registerDatasourceDomain = RegisterDatasourceInfra();

    on<RegisterUsuario>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        await _loginDatasouceDomain.loginUsuario(event.usuario);
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

    on<LoginUsuario>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        await _registerDatasourceDomain.registerUsuario(event.usuario);
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
