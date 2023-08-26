import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/jokes_datasource_domain.dart';
import 'package:tesis_app/domain/entities/jokes_entitie.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/infraestructure/mappers/medicine_mapper.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_response.dart';

//https://tesis-xz3b.onrender.com/medicines/getList/64e2a6811e350d9b1c1c2fae
class JokeDatasouserceInfra extends JokesDataSourceDomain {
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

  @override
  Future<List<Medicine>> getAllMedicine(String id) async {
    id = '64e2a6811e350d9b1c1c2fae';
    final response = await dio.get('/medicines/getList/$id');
    return JsonToMedicines(response.data);
  }

  // List<Joke> JsonToJokes(Map<String, dynamic> json) {
  //   final jokeResponse = JokeList.fromJson(json);
  // }

  @override
  Future<Joke> getOneJoke(int id) {
    // TODO: implement getOneJoke
    throw UnimplementedError();
  }
}
