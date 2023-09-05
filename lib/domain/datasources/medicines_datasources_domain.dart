import 'package:tesis_app/domain/entities/medicine_entitie.dart';

abstract class MedicineDataSourceDomain {
  Future<bool> postNewMedicine(Medicine medicine);

  Future<List<Medicine>> getAllMedicine(String id);
}
