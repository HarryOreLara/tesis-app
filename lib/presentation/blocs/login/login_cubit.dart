import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

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
