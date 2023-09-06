import 'package:tesis_app/domain/entities/medicine_entitie.dart';

class MedicineMapper {
  static Medicine medicineDbToEntity(Medicine medicine) => Medicine(
      id: medicine.id,
      nombre: medicine.nombre,
      cantidadMedicamentos: medicine.cantidadMedicamentos,
      horaInicio: medicine.horaFin,
      horaIntermedio: medicine.horaIntermedio,
      horaFin: medicine.horaFin);
}
