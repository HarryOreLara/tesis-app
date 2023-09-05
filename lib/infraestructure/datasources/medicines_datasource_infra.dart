import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/medicines_datasources_domain.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/infraestructure/mappers/medicine_mapper.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_response.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicines_list_response.dart';

//https://tesis-xz3b.onrender.com/medicines/getList/64e2a6811e350d9b1c1c2fae
class MedicineDbDatasourceInfra extends MedicineDataSourceDomain {


  final dio =
      Dio(BaseOptions(baseUrl: 'https://tesis-xz3b.onrender.com', headers: {
    'x-auth-token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTJhNjgxMWUzNTBkOWIxYzFjMmZhZSIsImlhdCI6MTY5MjU3NTM2MX0.5rES-UtmnEAJZonUqPQ9cHll30wsNSY8zUVzIqXn5zo'
  }));

  List<Medicine> JsonToMedicines(Map<String, dynamic> json) {
    final medicineResponse = MedicinesReponse.fromJson(json);
    final List<Medicine> medicines = medicineResponse.newMedicine
        .map((medicinesDb) => MedicineMapper.medicineDbToEntity(medicinesDb))
        .toList();

    return medicines;
  }


  //TODO: Cambiar id por la dinamica al momneto de crear usuario
  @override
  Future<List<Medicine>> getAllMedicine(String id) async {
    //id = '64e2a6811e350d9b1c1c2fae';
    final response = await dio.get('/medicines/getList/$id');
    return JsonToMedicines(response.data);
  }
  
  @override
  Future<bool> postNewMedicine(Medicine medicine) {
    // TODO: implement postNewMedicine
    throw UnimplementedError();
  }


  // @override
  // Future<MedicinesReponse> postNewMedicine(Medicine medicine) async {
  //   final response = await dio.post('/medicines/post', data: medicine);
  //   final medicineLista = MedicineList.fromJson(response.data);
  //   final medicineResponse = MedicinesReponse(
  //       ok: true, msg: 'Guardo con exito', newMedicine: [medicineLista]);
  //   return medicineResponse;
  // }
}
