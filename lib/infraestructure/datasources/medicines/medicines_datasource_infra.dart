import 'package:dio/dio.dart';
import 'package:tesis_app/config/constants/enviroment.dart';
import 'package:tesis_app/config/errors/exception.dart';
import 'package:tesis_app/domain/datasources/medicines/medicines_datasources_domain.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/mappers/medicine_mapper.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_marcacion_model.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_model.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_response.dart';

class MedicineDbDatasourceInfra extends MedicineDataSourceDomain {
  Dio nuevo(String token) {
    return Dio(BaseOptions(
        baseUrl: Enviroment.apiUrl,
        headers: {'Content-Type': 'application/json', 'x-auth-token': token}));
  }

  final dio = Dio(BaseOptions(
      baseUrl: Enviroment.apiUrl,
      headers: {'Content-Type': 'application/json', 'x-auth-token': 'token'}));

  List<MedicineModel> JsonToMedicines(Map<String, dynamic> json) {
    final medicineResponse = MedicinesReponse.fromJson(json);
    final List<MedicineModel> medicines = medicineResponse.newMedicine
        .map((medicinesDb) => MedicineMapper.medicineDbToEntity(medicinesDb))
        .toList();
    return medicines;
  }

  @override
  Future<List<MedicineModel>> getAllMedicine(String id) async {
    try {
      final response =
          await dio.get('/medicines/getList/$id'); //ok, medicineList

      if (response.statusCode != 200) {
        throw APIException(
            message: response.statusMessage, statusCode: response.statusCode);
      }
      return JsonToMedicines(response.data);
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<MedicineModel>> getMedicinesByUser(String idUser) async {
    try {
      final response = await dio.get('/medicines/getList/$idUser');
      final res = MedicinesReponse.fromJson(response.data);
      final List<MedicineModel> medicinas = res.newMedicine
          .map((medicinesDb) => MedicineMapper.medicineDbToEntity(medicinesDb))
          .toList();
      return medicinas;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<bool> postNewMedicine(MedicineModel medicine) async {
    final authService = AuthService();
    final tokenNullable = await authService.getToken();
    final token = tokenNullable ?? "";
    try {
      final medicineJson = medicine.toMap();
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

  @override
  Future<void> createMarcacion(MedicineMarcacionModel marcacionModel) async {
    try {
      final response =
          await dio.post('/medicines/marcacion', data: marcacionModel.toMap());
      if (response.statusCode != 200) {
        throw APIException(
            message: response.statusMessage, statusCode: response.statusCode);
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
