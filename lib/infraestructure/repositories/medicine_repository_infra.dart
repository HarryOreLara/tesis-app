import 'package:tesis_app/domain/datasources/medicines_datasources_domain.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/domain/repositories/medicines_repository_domain.dart';

class MedicineRepositoryInfra extends MedicineRepository {
  final MedicineDataSourceDomain medicineDataSourceDomain;

  MedicineRepositoryInfra(this.medicineDataSourceDomain);

  @override
  Future<bool> postNewMedicine(Medicine medicine) {
    return medicineDataSourceDomain.postNewMedicine(medicine);
  }

  @override
  Future<List<Medicine>> getAllMedicine(String id) {
    return medicineDataSourceDomain.getAllMedicine(id);
  }

  @override
  Future<bool> deleteMedicine(String id) {
    return medicineDataSourceDomain.deleteMedicine(id);
  }
}
