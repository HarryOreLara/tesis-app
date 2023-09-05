import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:tesis_app/domain/entities/auth/usuario_entitie.dart';

import 'package:tesis_app/infraestructure/datasources/auth/login_datasource_infra.dart';
import 'package:tesis_app/infraestructure/datasources/auth/register_datasource_infra.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<bool> login() async {
    LoginDatasouceInfra loginDatasouceInfra = LoginDatasouceInfra();
    Usuario usuario =
        Usuario(state.dniProfile.value, state.passwordLogin.value);
    try {
      final res = loginDatasouceInfra.loginUsuario(usuario);
      return res;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register() async {
    RegisterDatasourceInfra registerDatasourceInfra = RegisterDatasourceInfra();
    Usuario usuario =
        Usuario(state.dniProfile.value, state.passwordLogin.value);
    try {
      final res = registerDatasourceInfra.registerUsuario(usuario);
      return res;
    } catch (e) {
      return false;
    }
  }

  void dniLoginChange(String value) {
    final dniLogin = DniProfile.dirty(value);
    emit(state.copyWith(
        dniProfile: dniLogin,
        isValid: Formz.validate([dniLogin, state.passwordLogin])));
  }

  void passwordLoginchange(String value) {
    final passwordLogin = PasswordLogin.dirty(value);
    emit(state.copyWith(
        passwordLogin: passwordLogin,
        isValid: Formz.validate([passwordLogin, state.dniProfile])));
  }
}
