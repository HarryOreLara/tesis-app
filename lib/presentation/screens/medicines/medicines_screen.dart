import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/bloc/medicines/medicine_bloc.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class MedicinesScreen extends StatefulWidget {
  static const String name = 'medicines_screen';
  const MedicinesScreen({super.key});

  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends State<MedicinesScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();

  @override
  void initState() {
    context.read<MedicineBloc>().add(GetMedicineByUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<MedicineBloc, MedicineState>(
      builder: (context, state) {
        if (state.error != '') {
          Future.delayed(Duration.zero, () {
            context.read<MedicineBloc>()
              ..add(MedicineInit())
              ..add(GetMedicineByUser());
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.error,
                style: const TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.red,
            ));
          });
        }
        if (state.add) {
          Future.delayed(Duration.zero, () {
            context.read<MedicineBloc>()
              ..add(MedicineInit())
              ..add(GetMedicineByUser());
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Medicina agregada",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
            ));
          });
        }
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: AppBar(
              leading: GestureDetector(
                onTap: () {
                  context.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    print("Recomendado");
                  },
                  child: const Icon(
                    Icons.medication_outlined,
                    color: Colors.white,
                    size: 35.0,
                  ),
                )
              ],
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
          body: state.loading
              ? const CustomCircularProgres()
              : state.listMedicine.isEmpty
                  ? const NingunElementoNotification(
                      mensaje: "No hay medicinas",
                    )
                  : Column(
                      children: [
                        FadeInDown(
                            child: SizedBox(
                          width: size.width * 1,
                          height: size.height * 0.3,
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(120)),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 7, 197, 255),
                                      Color.fromARGB(255, 0, 109, 255),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  'MEDICAMENTOS',
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.white,
                                      fontFamily: 'Gotham-Bold'),
                                )),
                                Center(
                                  child: Text(
                                    'Por que tu salud es muy importante',
                                    style:
                                        TextStyle(fontFamily: 'Gotham-Black'),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: size.height * 0.6,
                            child: ListView.builder(
                              itemCount: state.listMedicine.length,
                              itemBuilder: (context, index) {
                                final medicine = state.listMedicine[index];
                                return FadeInRight(
                                    child: ListCustomItemsMedicine(
                                        medicine: medicine));
                              },
                            ))
                      ],
                    ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) => AddMedicineDialog(
                    nombreController: nombreController,
                    cantidadController: cantidadController,
                  ),
                );
              },
              backgroundColor: const Color.fromARGB(255, 51, 162, 237),
              icon: const Icon(Icons.add),
              label: const Text(
                "Agregar nueva medicina",
                style: TextStyle(fontSize: 18.0, fontFamily: 'Gotham-Medium'),
              )),
        );
      },
    );
  }
}
