import 'package:tesis_app/infraestructure/models/medicines/medicine_marcacion_model.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_model.dart';

abstract class MedicineDataSourceDomain {
  Future<bool> postNewMedicine(MedicineModel medicine);

  Future<List<MedicineModel>> getAllMedicine(String id);

  Future<bool> deleteMedicine(String id);

  Future<List<MedicineModel>> getMedicinesByUser(String idUser);

  Future<void> createMarcacion(MedicineMarcacionModel marcacionModel);
}
