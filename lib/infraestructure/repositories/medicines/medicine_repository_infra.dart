import 'package:tesis_app/domain/datasources/medicines/medicines_datasources_domain.dart';
import 'package:tesis_app/domain/repositories/medicines/medicines_repository_domain.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_marcacion_model.dart';
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
  Future<List<MedicineModel>> getMedicinesByUser(String idUser) {
    return medicineDataSourceDomain.getMedicinesByUser(idUser);
  }

  @override
  Future<void> createMarcacion(MedicineMarcacionModel marcacionModel) {
    return medicineDataSourceDomain.createMarcacion(marcacionModel);
  }
}
