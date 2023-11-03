import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tesis_app/infraestructure/datasources/medicines/medicines_datasource_infra.dart';
import 'package:tesis_app/infraestructure/repositories/medicines/medicine_repository_infra.dart';

final medicineRepositoryProvider = Provider((ref) {
  return MedicineRepositoryInfra(MedicineDbDatasourceInfra());
});
