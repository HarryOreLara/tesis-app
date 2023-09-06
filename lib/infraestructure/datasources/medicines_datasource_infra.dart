import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/medicines_datasources_domain.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/mappers/medicine_mapper.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_response.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicines_list_response.dart';

class MedicineDbDatasourceInfra extends MedicineDataSourceDomain {
  Dio nuevo(String token) {
    return Dio(BaseOptions(
        baseUrl: 'https://tesis-xz3b.onrender.com',
        headers: {'Content-Type': 'application/json', 'x-auth-token': token}));
  }

  final dio = Dio(BaseOptions(
      baseUrl: 'https://tesis-xz3b.onrender.com',
      headers: {'Content-Type': 'application/json', 'x-auth-token': 'token'}));

  List<Medicine> JsonToMedicines(Map<String, dynamic> json) {
    final medicineResponse = MedicinesReponse.fromJson(json);
    final List<Medicine> medicines = medicineResponse.newMedicine
        .map((medicinesDb) => MedicineMapper.medicineDbToEntity(medicinesDb))
        .toList();
    return medicines;
  }

  @override
  Future<List<Medicine>> getAllMedicine(String id) async {
    final response = await dio.get('/medicines/getList/$id'); //ok, medicineList
    return JsonToMedicines(response.data);
  }

//TODO:Nos quedamos aca
  Future<List<Medicine>> getMedicines(String idUser) async {
    final response = await dio.get('/medicines/getList/$idUser');
    final res = MedicinesReponse.fromJson(response.data);
    final List<Medicine> medicinas = res.newMedicine
        .map((medicinesDb) => MedicineMapper.medicineDbToEntity(medicinesDb))
        .toList();
    return medicinas;
  }


  @override
  Future<bool> postNewMedicine(Medicine medicine) async {
    final authService = AuthService();
    final tokenNullable = await authService.getToken();
    final token = tokenNullable ?? "";
    try {
      final medicineJson = medicine.toJson();
      // final response = await dio.post('/medicines/post', data: medicineJson);
      final response =
          await nuevo(token).post('/medicines/post', data: medicineJson);
      final res = MedicinesReponse.fromJson(response.data);
      return res.ok;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteMedicine(String id) async {
    try {
      final response = await dio.delete('/medicines/delete/$id');
      final res = MedicinesReponse.fromJson(response.data);
      return res.ok;
    } catch (e) {
      return false;
    }
  }
}
