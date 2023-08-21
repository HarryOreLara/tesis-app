import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_response.dart';

abstract class MedicineDataSourceDomain{

  Future<MedicinesReponse> postNewMedicine(Medicine medicine);

  Future<List<Medicine>> getAllMedicine({String id = ''});

}