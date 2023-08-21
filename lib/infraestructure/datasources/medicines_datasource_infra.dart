import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/medicines_datasources_domain.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_response.dart';

class MedicineDbDatasourceInfra extends MedicineDataSourceDomain {
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000/', headers: {
    'x-auth-token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTJhNjgxMWUzNTBkOWIxYzFjMmZhZSIsImlhdCI6MTY5MjU3NTM2MX0.5rES-UtmnEAJZonUqPQ9cHll30wsNSY8zUVzIqXn5zo'
  }));


  // String _JsonToMedicines(Map<String, dynamic> json){
  //   final medicineResponse = MedicinesReponse.fromJson(json);
  //   final String medicines = medicineResponse.toString();

  //   return medicines;
  // }


  @override
  Future<List<Medicine>> getAllMedicine({String id = ''}) {

    throw UnimplementedError();
  }
  
  
  @override
  Future<MedicinesReponse> postNewMedicine(Medicine medicine) async{
    final response = await dio.post('medicines/post', data: medicine);
    final medicineRes = MedicinesReponse(ok: true, msg: "Todo correcto", data:response);
    return medicineRes;
  }



}
