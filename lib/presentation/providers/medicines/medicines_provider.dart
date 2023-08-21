import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/infraestructure/datasources/medicines_datasource_infra.dart';
import 'package:tesis_app/presentation/providers/medicines/medicines_repository_provider.dart';

//Esto es para poder obtener el id de la persona del celular
//Para asi poder hacer los metodos http
final idPersonaProvider = Provider<String>((ref) {
  // Devuelve el ID de la persona que consulta
  return '64e2a6811e350d9b1c1c2fae';
});

//Guardar esto siempre, sirve mucho
final medicinasProvider =
    FutureProvider.autoDispose<List<Medicine>>((ref) async {
  final idPersona = ref.read(idPersonaProvider);
  // final url = 'https://tesis-xz3b.onrender.com/medicines/getList/$idPersona';
  // final response = await Dio().get(url);
  final medicineDataSourceInfra = MedicineDbDatasourceInfra();
  final datita = medicineDataSourceInfra.getAllMedicine(idPersona);
  return datita;
  //return medicineDataSourceInfra.JsonToMedicines(response.data);
  //return JsonToMedicines(response.data); //Paso 2
});



final deleteMedicinesProvider =
    FutureProvider.autoDispose<List<Medicine>>((ref) async {
  final idPersona = ref.read(idPersonaProvider);
  final medicineDataSourceInfra = MedicineDbDatasourceInfra();
  final datita = medicineDataSourceInfra.getAllMedicine(idPersona);
  return datita;
});




//Esto no se utiliza
final getMedicinesByIdMedicineProvider =
    StateNotifierProvider<MedicinesByNotifier, Map<String, List<Medicine>>>(
        (ref) {
  final medicineRepository = ref.watch(medicineRepositoryProvider);
  return MedicinesByNotifier(
      getListMedicines: medicineRepository.getAllMedicine);
});

typedef GetMedicinesCallback = Future<List<Medicine>> Function(
    String idMedicine);

class MedicinesByNotifier extends StateNotifier<Map<String, List<Medicine>>> {
  final GetMedicinesCallback getListMedicines;

  MedicinesByNotifier({required this.getListMedicines}) : super({});

  Future<void> loadMedicines(String idMedcine) async {
    if (state[idMedcine] != null) return;
    final List<Medicine> medicine = await getListMedicines(idMedcine);

    state = {...state, idMedcine: medicine};
  }
}
