import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<bool> login() async {
    var dio = Dio();
    try {
      var response = await dio
          .post('https://tesis-xz3b.onrender.com/auth/login', data: {
        "username": state.dniProfile.value,
        "password": state.passwordLogin.value
      });

      Map<String, dynamic> data = response.data;
      final bool ok = data.containsKey('ok') ? data['ok'] : false;
      return ok;
    } catch (e) {
      return false;
    }
  }

  void register() async {
    var dio = Dio();
    try {
      var response = await dio
          .post('https://tesis-xz3b.onrender.com/auth/register', data: {
        "username": state.dniProfile.value,
        "password": state.passwordLogin.value
      });
      print(response);
    } catch (e) {
      print(e);
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
