import 'package:tesis_app/domain/datasources/medicines_datasources_domain.dart';
import 'package:tesis_app/domain/repositories/medicines_repository_domain.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_model.dart';

class MedicineRepositoryInfra extends MedicineRepository {
  final MedicineDataSourceDomain medicineDataSourceDomain;

  MedicineRepositoryInfra(this.medicineDataSourceDomain);

  @override
  Future<bool> postNewMedicine(MedicineModel medicine) {
    return medicineDataSourceDomain.postNewMedicine(medicine);
  }

  @override
  Future<List<MedicineModel>> getAllMedicine(String id) {
    return medicineDataSourceDomain.getAllMedicine(id);
  }

  @override
  Future<bool> deleteMedicine(String id) {
    return medicineDataSourceDomain.deleteMedicine(id);
  }

  @override
  Future<List<MedicineModel>> getMedicines(String idUser) {
    return medicineDataSourceDomain.getMedicines(idUser);
  }
}
