import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/medicines_datasource_infra.dart';

import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_model.dart';
import 'package:tesis_app/infraestructure/repositories/medicine_repository_infra.dart';

part 'new_medicines_state.dart';

class NewMedicinesCubit extends Cubit<NewMedicinesState> {
  NewMedicinesCubit() : super(const NewMedicinesState());

  MedicineRepositoryInfra medicineRepositoryInfra =
      MedicineRepositoryInfra(MedicineDbDatasourceInfra());

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

  Future<bool> guardarBaseDatos() async {
    MedicineModel medicine = MedicineModel(
        id: '',
        nombre: state.nombreMedicine.value,
        cantidadMedicamentos: state.cantidadPastillas.value,
        horaInicio: state.horaInicio.value,
        horaIntermedio: state.horaIntermedia.value,
        horaFin: state.horaFin.value);
    try {
      final res = medicineRepositoryInfra.postNewMedicine(medicine);
      return res;
    } catch (error) {
      return false;
    }
  }

  Future<List<Medicine>> getMedicineByUser() async {
    final authService = AuthService();
    final idPersonaNullable = await authService.getUserId();
    final idPersona = idPersonaNullable ?? "";
    try {
      final res = medicineRepositoryInfra.getMedicines(idPersona);
      return res;
    } catch (e) {
      return [];
    }
  }

  Future<bool> deleteMedicine(String medicineId) async {
    try {
      final res = medicineRepositoryInfra.deleteMedicine(medicineId);
      return res;
    } catch (e) {
      return false;
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
