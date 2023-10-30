import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/datasources/medicines_datasources_domain.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/medicines_datasource_infra.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_model.dart';

part 'medicine_event.dart';
part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  late MedicineDataSourceDomain _medicineDataSourceDomain;

  MedicineBloc() : super(const MedicineState()) {
    _medicineDataSourceDomain = MedicineDbDatasourceInfra();
    on<MedicineInit>((event, emit) {
      emit(state.copyWith(add: false, loading: false, error: ''));
    });

    on<GetMedicineByUser>((event, emit) async {
      final authService = AuthService();
      final idPersonaNullable = await authService.getUserId();
      final idPersona = idPersonaNullable ?? "";
      try {
        emit(state.copyWith(loading: true));
        final listMedicines =
            await _medicineDataSourceDomain.getMedicines(idPersona);
        emit(state.copyWith(loading: false, listMedicine: listMedicines));
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

    on<CreatedMedicine>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));

        await _medicineDataSourceDomain.postNewMedicine(event.medicine);
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

    on<DeleteMedicine>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        await _medicineDataSourceDomain.deleteMedicine(event.id);
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
