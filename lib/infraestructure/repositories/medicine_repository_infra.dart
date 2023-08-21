import 'package:tesis_app/domain/datasources/medicines_datasources_domain.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/domain/respositories/medicines_repository_domain.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_response.dart';

class MedicineRepositoryInfra extends MedicineRepository{
  final MedicineDataSourceDomain medicineDataSourceDomain;

  MedicineRepositoryInfra(this.medicineDataSourceDomain);

  @override
  Future<MedicinesReponse> postNewMedicine(Medicine medicine) {
    return medicineDataSourceDomain.postNewMedicine(medicine);
  }


  @override
  Future<List<Medicine>> getAllMedicine({String id = ''}) {
    return medicineDataSourceDomain.getAllMedicine();
  }



}