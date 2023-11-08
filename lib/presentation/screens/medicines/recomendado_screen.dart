import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/config/constants/medicines/medicines_contant.dart';
import 'package:tesis_app/presentation/bloc/medicines/medicine_bloc.dart';

class RecomendadoScreen extends StatelessWidget {
  static const String name = 'recomendado_screen';

  const RecomendadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medicinas Frecuentes"),
        centerTitle: true,
      ),
      body: BlocBuilder<MedicineBloc, MedicineState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: itemsMedicineConstant.length,
            itemBuilder: (context, index) {
              final medicina = itemsMedicineConstant[index];
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 68, 211, 255))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        medicina.nombre,
                        style: const TextStyle(
                            fontFamily: 'Gotham-Book',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          size: 30.0,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          context
                              .read<MedicineBloc>()
                              .add(CreatedMedicine(medicine: medicina));
                          context.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
