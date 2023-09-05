import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicines_list_response.dart';

class MedicineMapper {
  static Medicine medicineDbToEntity(MedicineList medicineList) => Medicine(
      id: medicineList.id,
      nombre: medicineList.nombre,
      cantidadMedicamentos: medicineList.cantidadMedicamentos,
      horaInicio: medicineList.horaFin,
      horaIntermedio: medicineList.horaIntermedio,
      horaFin: medicineList.horaFin);
}
