
import 'package:tesis_app/infraestructure/models/medicines/medicine_model.dart';

class MedicineMapper {
  static MedicineModel medicineDbToEntity(MedicineModel medicine) => MedicineModel(
      id: medicine.id,
      nombre: medicine.nombre,
      cantidadMedicamentos: medicine.cantidadMedicamentos,
      horaInicio: medicine.horaFin,
      horaIntermedio: medicine.horaIntermedio,
      horaFin: medicine.horaFin);
}
