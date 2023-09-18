import 'package:tesis_app/domain/entities/medicine_entitie.dart';

abstract class MedicineRepository {
  Future<bool> postNewMedicine(Medicine medicine);

  Future<List<Medicine>> getAllMedicine(String id);

  Future<bool> deleteMedicine(String id);

  Future<List<Medicine>> getMedicines(String idUser);
}
