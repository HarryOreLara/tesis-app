import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';

import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';

part 'new_medicines_state.dart';

class NewMedicinesCubit extends Cubit<NewMedicinesState> {
  NewMedicinesCubit() : super(const NewMedicinesState());

  void onSubmit() async {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        nombreMedicine: NombreMedicine.dirty(state.nombreMedicine.value),
        cantidadPastillas:
            CantidadPastillas.dirty(state.cantidadPastillas.value),
        horaInicio: HoraInicio.dirty(state.horaInicio.value),
        horaIntermedia: HoraIntermedia.dirty(state.horaIntermedia.value),
        horaFin: HoraFin.dirty(state.horaFin.value),
        isValid: Formz.validate([
          state.nombreMedicine,
          state.cantidadPastillas,
          state.horaInicio,
          state.horaFin,
        ])));
  }

  void guardarBaseDatos() async {
    var authService = AuthService();
    final String token = authService.getToken().toString();
    var dio = Dio(BaseOptions(headers: {'x-auth-token': token}));
    try {
      await dio.post('https://tesis-xz3b.onrender.com/medicines/post', data: {
        "nombre": state.nombreMedicine.value,
        "cantidadMedicamentos": state.cantidadPastillas.value,
        "horaInicio": state.horaInicio.value,
        "horaIntermedio": state.horaIntermedia.value,
        "horaFin": state.horaFin.value,
      });
    } catch (error) {
      print('Error al guardar en la base de datos: $error');
    }
  }

  void deleteMedicine(String? medicineId) async {
    final dio = Dio(); // Instancia de Dio para las solicitudes

    try {
      final response = await dio.delete(
          'https://tesis-xz3b.onrender.com/medicines/delete/$medicineId');

      if (response.statusCode == 200) {
        print('Eliminación exitosa');
      } else {
        print('Error en la eliminación');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void nameMedicineChange(String value) {
    final nombreMedicine = NombreMedicine.dirty(value);
    emit(state.copyWith(
        nombreMedicine: nombreMedicine,
        isValid: Formz.validate([
          nombreMedicine,
          state.cantidadPastillas,
          state.horaFin,
          state.horaIntermedia,
          state.horaInicio
        ])));
  }

  void amountPillsChange(String value) {
    final cantidadPastillas = CantidadPastillas.dirty(value);
    emit(state.copyWith(
        cantidadPastillas: cantidadPastillas,
        isValid: Formz.validate([
          cantidadPastillas,
          state.nombreMedicine,
          state.horaFin,
          state.horaIntermedia,
          state.horaInicio
        ])));
  }

  void hoursStartChange(String value) {
    final horaInicio = HoraInicio.dirty(value);
    emit(state.copyWith(
        horaInicio: horaInicio,
        isValid: Formz.validate([
          horaInicio,
          state.nombreMedicine,
          state.cantidadPastillas,
          state.horaFin,
          state.horaIntermedia,
        ])));
  }

  void hoursEndChange(String value) {
    final horaFin = HoraFin.dirty(value);
    emit(state.copyWith(
        horaFin: horaFin,
        isValid: Formz.validate([
          horaFin,
          state.nombreMedicine,
          state.cantidadPastillas,
          state.horaInicio,
          state.horaIntermedia,
        ])));
  }

  void hoursMidChange(String value) {
    final horaIntermedia = HoraIntermedia.dirty(value);
    emit(state.copyWith(
        horaIntermedia: horaIntermedia,
        isValid: Formz.validate([
          horaIntermedia,
          state.nombreMedicine,
          state.cantidadPastillas,
          state.horaInicio,
          state.horaFin
        ])));
  }
}
