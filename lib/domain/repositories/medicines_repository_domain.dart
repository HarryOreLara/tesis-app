
import 'package:tesis_app/infraestructure/models/medicines/medicine_model.dart';

abstract class MedicineRepository {
  Future<bool> postNewMedicine(MedicineModel medicine);

  Future<List<MedicineModel>> getAllMedicine(String id);

  Future<bool> deleteMedicine(String id);

  Future<List<MedicineModel>> getMedicines(String idUser);
}
