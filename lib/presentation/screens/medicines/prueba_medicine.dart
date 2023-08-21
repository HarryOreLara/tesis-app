import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tesis_app/presentation/providers/medicines/medicines_provider.dart';


// final idPersonaProvider = Provider<String>((ref) {
//   // Devuelve el ID de la persona que consulta
//   return '64e2a6811e350d9b1c1c2fae';
// });

// final medicinasProvider =
//     FutureProvider.autoDispose<List<Medicine >>((ref) async {
//   final idPersona = ref.read(idPersonaProvider);
//   final url = 'https://tesis-xz3b.onrender.com/medicines/getList/$idPersona';
//   final response = await Dio().get(url);
//   return JsonToMedicines(response.data);//Paso 2

// });


// List<Medicine> JsonToMedicines(Map<String, dynamic> json) {
//   final medicineResponse = MedicinesReponse.fromJson(json);
//   final List<Medicine> medicines = medicineResponse.newMedicine
//       .map((medicinesDb) => MedicineMapper.medicineDbToEntity(medicinesDb))
//       .toList();

//   return medicines;
// }

class MedicinasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicinas'),
      ),
      body: Center(
        child: MedicinasList(),
      ),
    );
  }
}

class MedicinasList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final medicinasAsyncValue = ref.watch(medicinasProvider);//Paso 1

    return medicinasAsyncValue.when(
      data: (medicinas) {
        return ListView.builder(
          itemCount: medicinas.length,
          itemBuilder: (context, index) {
            final medicina = medicinas[index];
            return ListTile(
              title: Text(medicina.nombre),
              // Otros campos de la medicina
            );
          },
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error al cargar las medicinas'),
    );
  }
}
