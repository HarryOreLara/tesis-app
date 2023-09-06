import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/presentation/blocs/new_medicine/new_medicines_cubit.dart';
import 'package:tesis_app/presentation/providers/providers.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

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

class _Listita extends StatefulWidget {
  const _Listita({super.key});

  @override
  State<_Listita> createState() => __ListitaState();
}

class __ListitaState extends State<_Listita> {
  List<Medicine> medicines = [];

  @override
  void initState() {
    super.initState();
    context.read<NewMedicinesCubit>().getMedicineByUser();
  }

  Future<void> loadMedicines() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewMedicinesCubit, NewMedicinesState>(
        builder: (context, state) {
          if (state is YourLoadedState) {
            // Los datos están disponibles, puedes mostrarlos aquí
            final medicines = state.medicines;
            return ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(medicines[index]
                      .nombre), // Ajusta según tu modelo Medicine
                );
              },
            );
          } else if (state is YourLoadingState) {
            // Muestra una indicación de carga mientras se obtienen los datos
            return Center(child: CircularProgressIndicator());
          } else {
            // Otro estado, como un estado de error
            return Center(child: Text('Error al cargar los datos'));
          }
        },
      ),
    );
  }
}

class _ListMedicines extends ConsumerWidget {
  const _ListMedicines();

  @override
  Widget build(BuildContext context, ref) {
    final medicinasAsyncValue = ref.watch(medicinasProvider); //Paso 1
    final medicineCubit = context.watch<NewMedicinesCubit>();

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
                        child: BlocProvider(
                          create: (context) => NewMedicinesCubit(),
                          child: ModalMedicineDetail(
                              size: size, itemMedicine: medicine),
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
