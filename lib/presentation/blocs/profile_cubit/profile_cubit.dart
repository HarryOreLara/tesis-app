import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
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
      ])
    ));

    print('Todo llego al cubit $state');
  }

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
