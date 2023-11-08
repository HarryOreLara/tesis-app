part of 'medicine_bloc.dart';

abstract class MedicineEvent extends Equatable {
  const MedicineEvent();

  @override
  List<Object> get props => [];
}

class MedicineInit extends MedicineEvent {}

class GetOneMedicine extends MedicineEvent {
  final String id;

  const GetOneMedicine({required this.id});
}

class GetMedicineByUser extends MedicineEvent {}

class CreatedMedicine extends MedicineEvent {
  final MedicineModel medicine;

  const CreatedMedicine({required this.medicine});
}

class DeleteMedicine extends MedicineEvent {
  final String id;

  const DeleteMedicine({required this.id});
}

class MarcacionMedicine extends MedicineEvent {
  final String nombre;
  final String idMedicine;

  const MarcacionMedicine({required this.nombre, required this.idMedicine});
}
