import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

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
        horaFin: HoraFin.dirty(state.horaFin.value),
        isValid: Formz.validate([
          state.nombreMedicine,
          state.cantidadPastillas,
          state.horaInicio,
          state.horaFin,
        ])));
    //print('Todo llego al cubit: ${state.nombreMedicine}');
  }

  void guardarBaseDatos() async {

    var dio = Dio(BaseOptions(headers: {
      'x-auth-token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTJhNjgxMWUzNTBkOWIxYzFjMmZhZSIsImlhdCI6MTY5MjU3NTM2MX0.5rES-UtmnEAJZonUqPQ9cHll30wsNSY8zUVzIqXn5zo'
    }));

    try {
      var response = await dio
          .post('https://tesis-xz3b.onrender.com/medicines/post', data: {
        "nombre": state.nombreMedicine.value,
        "cantidadMedicamentos": state.cantidadPastillas.value,
        "horaInicio": state.horaInicio.value,
        "horaIntermedio": "15:00",
        "horaFin": state.horaFin.value,
      });
      print(response.statusCode);
      print(response.data.toString());
    } catch (error) {
      print('Error al guardar en la base de datos: $error');
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
          state.horaFin
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
          state.horaInicio
        ])));
  }
}
