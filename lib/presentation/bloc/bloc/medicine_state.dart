part of 'medicine_bloc.dart';

class MedicineState extends Equatable {
  final bool loading;
  final String error;
  final bool add;
  final List<Medicine> listMedicine;
  const MedicineState(
      {this.loading = false,
      this.error = '',
      this.add = false,
      this.listMedicine = const []});

  MedicineState copyWith(
          {bool? loading,
          String? error,
          bool? add,
          List<Medicine>? listMedicine}) =>
      MedicineState(
          loading: loading ?? this.loading,
          error: error ?? this.error,
          add: add ?? this.add,
          listMedicine: listMedicine ?? this.listMedicine);
  @override
  List<Object> get props => [loading, error, add, listMedicine];
}

final class MedicineInitial extends MedicineState {}
