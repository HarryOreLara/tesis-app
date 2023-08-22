import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  void onSubmit() async {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        nombreProfile: NombreProfile.dirty(state.nombreProfile.value),
        apellidosProfile: ApellidosProfile.dirty(state.apellidosProfile.value),
        dniProfile: DniProfile.dirty(state.dniProfile.value),
        edadProfile: EdadProfile.dirty(state.edadProfile.value),
        generoProfile: GeneroProfile.dirty(state.generoProfile.value),
        isValid: Formz.validate([
          state.nombreProfile,
          state.apellidosProfile,
          state.dniProfile,
          state.edadProfile,
          state.generoProfile
        ])));

    print('Todo llego al cubit $state');
  }

//TODO: Tener en cuenta que esta forma de registor esta mal
//Para ello vamos a tener que crear un login desde el incio para asi poder controlar
//los tokens entrantes porque sino luego se complicara mas
//mas abajo estan todas las funciones necesaria spara guardar y destruir los tokens
  void guardarPersona() async {
    var dio = Dio();
    try {
      var response =
          await dio.post('https://tesis-xz3b.onrender.com/persona/post', data: {
        "nombre": state.nombreProfile.value,
        "apellidos": state.apellidosProfile.value,
        "edad": state.edadProfile.value,
        "genero": state.generoProfile.value,
        "dni": state.dniProfile.value
      });

      print(response.statusCode);
      print(response.data.toString());

      if (response.statusCode == 200) {
        String token = response.data['token'];
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('token', token);
        print('Token almacenado en sherdpreferences: $token');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String?> obtenerToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

// String? token = await obtenerToken();
// if (token != null) {
//   // Hacer algo con el token, como enviarlo en las solicitudes posteriores
// }

  void eliminarToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    print('Token eliminado de SharedPreferences.');
  }

// String? token = await obtenerToken();
// if (token != null) {
//   // Realizar operaciones utilizando el token
// } else {
//   // El usuario no ha iniciado sesión, redirigir a la pantalla de inicio de sesión
// }

  void nombreProfileChange(String value) {
    final nombreProfile = NombreProfile.dirty(value);
    emit(state.copyWith(
        nombreProfile: nombreProfile,
        isValid: Formz.validate([
          nombreProfile,
          state.apellidosProfile,
          state.dniProfile,
          state.edadProfile,
          state.generoProfile
        ])));
  }

  void apellidoProfilechange(String value) {
    final apellidosProfile = ApellidosProfile.dirty(value);
    emit(state.copyWith(
        apellidosProfile: apellidosProfile,
        isValid: Formz.validate([
          apellidosProfile,
          state.nombreProfile,
          state.dniProfile,
          state.edadProfile,
          state.generoProfile
        ])));
  }

  void dniProfileChange(String value) {
    final dniProfile = DniProfile.dirty(value);
    emit(state.copyWith(
        dniProfile: dniProfile,
        isValid: Formz.validate([
          dniProfile,
          state.nombreProfile,
          state.apellidosProfile,
          state.edadProfile,
          state.generoProfile
        ])));
  }

  void edadProfileChange(String value) {
    final edadProfile = EdadProfile.dirty(value);
    emit(state.copyWith(
        edadProfile: edadProfile,
        isValid: Formz.validate([
          edadProfile,
          state.nombreProfile,
          state.apellidosProfile,
          state.dniProfile,
          state.generoProfile
        ])));
  }

  void generoProfileChange(String value) {
    final generoProfile = GeneroProfile.dirty(value);
    emit(state.copyWith(
        generoProfile: generoProfile,
        isValid: Formz.validate([
          generoProfile,
          state.nombreProfile,
          state.apellidosProfile,
          state.dniProfile,
          state.edadProfile
        ])));
  }
}
