import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:tesis_app/config/constants/medicines/medicines_contant.dart';

class MedicinesScreen extends StatelessWidget {
  static const String name = 'medicines_screen';
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 14, 199, 255),
                    Color.fromARGB(255, 0, 130, 255),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            FadeIn(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(120)),
                child: SizedBox(
                  width: size.width * 1,
                  height: size.height * 0.3,
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 7, 197, 255),
                      Color.fromARGB(255, 0, 109, 255),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'MEDICAMENTOS',
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                        ),
                        Center(
                          child: Text('Porque tu salud es muy importante'),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: size.height * 0.5,
              child: const _ListMedicines(),
            )
          ],
        ));
  }
}

class _ListMedicines extends StatelessWidget {
  const _ListMedicines();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: itemsMedicineConstant.length,
      itemBuilder: (context, index) {
        final itemMedicine = itemsMedicineConstant[index];
        return ListTile(
          title: Text(
            itemMedicine.nombre,
            style: const TextStyle(fontSize: 20),
          ),
          trailing: Icon(
            Icons.arrow_right_rounded,
            color: colors.primary,
          ),
          onTap: () {
            print(itemMedicine.nombre);
          },
        );
      },
    );
  }
}

// class _ItemOfListMedicines extends StatelessWidget {
//   final MedicinesConstant medicinesConstant;

//   const _ItemOfListMedicines({required this.medicinesConstant});

//   @override
//   Widget build(BuildContext context) {
//     // final colors = Theme.of(context).colorScheme;

//     return ListTile(
//       title: Text(
//         medicinesConstant.nombre
//       ),
//       onTap: () {
//         print(medicinesConstant.nombre);
//       },
//     );
//   }
// }
