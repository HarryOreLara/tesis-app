import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/presentation/blocs/new_medicine/new_medicines_cubit.dart';
import 'package:tesis_app/presentation/providers/providers.dart';

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
            flexibleSpace: const _CustomAppbar(),
          ),
        ),
        //body: MedicinasList());
        body: BlocProvider(
          create: (context) => NewMedicinesCubit(),
          child: _CardTittleMedicamentos(size: size),
        ));
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar();

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class _CardTittleMedicamentos extends StatelessWidget {
  const _CardTittleMedicamentos({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInDown(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'MEDICAMENTOS',
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                    const Center(
                      child: Text('Porque tu salud es muy importante'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          //TOD: Añadir funcionalidad para agregar nuevo medicamento
                          context.push('/newMedicine');
                        },
                        child: const Icon(
                          Icons.add,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
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
    );
  }
}


class _ListMedicines extends ConsumerWidget {
  const _ListMedicines();

  @override
  Widget build(BuildContext context, ref) {
    final medicinasAsyncValue = ref.watch(medicinasProvider); //Paso 1
    return medicinasAsyncValue.when(
      data: (medicinas) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: medicinas.length,
          itemBuilder: (context, index) {
            final medicina = medicinas[index];
            return FadeInRight(
              child: _ListCustomItemsMedicine(medicine: medicina),
            );
          },
        );
      },
      error: (error, stackTrace) => const Text('Error al cargar las medicinas'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _ListCustomItemsMedicine extends StatelessWidget {
  final Medicine medicine;

  const _ListCustomItemsMedicine({required this.medicine});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 7, 197, 255),
                    Color.fromARGB(235, 60, 236, 255)
                  ])),
              alignment: Alignment.center,
              height: 70,
              child: ListTile(
                title: Text(
                  medicine.nombre,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: SizedBox(
                  width: 80,
                  child: Row(
                    children: [
                      Text(
                        medicine.horaInicio.toString(),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(medicine.horaIntermedio.toString()),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(medicine.horaFin.toString()),
                      const SizedBox(
                        width: 60,
                      ),
                      const Icon(
                        Icons.alarm,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                //child: Text(itemMedicine.cantidadMedicamentos.toString())),
                trailing: Icon(
                  Icons.arrow_right_rounded,
                  color: colors.primary,
                ),

                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return FadeInRight(
                        child: SizedBox(
                          height: 400.0,
                          width: size.width * 1,
                          child: Column(
                            children: [
                              SizedBox(
                                width: size.width * 1,
                                child: Center(
                                  child: Text(
                                    medicine.nombre,
                                    style: const TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              SizedBox(
                                height: size.height * 0.3,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.45,
                                        child: Card(
                                          elevation: 3,
                                          child: Column(
                                            children: [
                                              const Center(
                                                child: Text(
                                                  'Horario',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20.0,
                                              ),
                                              Center(
                                                child: Text(
                                                  'La primera pastilla se debe de tomar en la hora ${medicine.horaInicio} am, ${medicine.horaIntermedio == "" ? '' : medicine.horaIntermedio} y la ultima se debe tomar a las ${medicine.horaFin}',
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: size.width * 0.45,
                                        child: Card(
                                          elevation: 3,
                                          child: Column(
                                            children: [
                                              const Center(
                                                child: Text(
                                                  'Cantidad de pastillas',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Center(
                                                child: Text(
                                                  'La cantidad de pastillas que se debe de tomar en la hora especifica con ${medicine.cantidadMedicamentos}',
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child:
                                          const Text('Actualizar medicamento'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          NewMedicinesCubit()
                                              .deleteMedicine(medicine.id);
                                        },
                                        child:
                                            const Text('Eliminar medicamento')),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
