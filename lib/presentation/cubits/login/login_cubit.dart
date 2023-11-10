import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:tesis_app/domain/entities/auth/usuario_entitie.dart';
import 'package:tesis_app/infraestructure/datasources/auth/login_datasource_infra.dart';
import 'package:tesis_app/infraestructure/datasources/auth/register_datasource_infra.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';
import 'package:tesis_app/infraestructure/repositories/auth/login_repository_intra.dart';
import 'package:tesis_app/infraestructure/repositories/auth/register_repository_infra.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  LoginRepositoryInfra loginRepositoryInfra =
      LoginRepositoryInfra(LoginDatasouceInfra());

  RegisterRepositoryInfra registerRepositoryInfra =
      RegisterRepositoryInfra(RegisterDatasourceInfra());

  Future<bool> login() async {
    Usuario usuario =
        Usuario(state.dniProfile.value, state.passwordLogin.value);
    try {
      final res = loginRepositoryInfra.loginUsuario(usuario);
      return res;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register() async {
    Usuario usuario =
        Usuario(state.dniProfile.value, state.passwordLogin.value);
    try {
      final res = registerRepositoryInfra.registerUsuario(usuario);
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
