
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tesis_app/domain/entities/medicines/medicine_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/medicines/medicines_datasource_infra.dart';

final medicinasProvider =
    FutureProvider.autoDispose<List<Medicine>>((ref) async {
  final authService = AuthService();
  final idPersonaNullable =
      await authService.getUserId(); // Puede ser String? (nullable)
  final idPersona =
      idPersonaNullable ?? ""; // Si es nulo, asigna un valor por defecto
  final medicineDataSourceInfra = MedicineDbDatasourceInfra();
  final datita = await medicineDataSourceInfra.getAllMedicine(idPersona);
  return datita;
});

