import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';
import 'package:tesis_app/presentation/bloc/medicines/medicine_bloc.dart';

class ListCustomItemsMedicine extends StatelessWidget {
  final Medicine medicine;

  const ListCustomItemsMedicine({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
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
                    ],
                  ),
                ),
                //child: Text(itemMedicine.cantidadMedicamentos.toString())),
                trailing: const Icon(
                  Icons.alarm,
                  color: Colors.red,
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
                                          context.read<MedicineBloc>().add(
                                              DeleteMedicine(id: medicine.id));
                                          Navigator.pop(context);
                                          context
                                              .read<MedicineBloc>()
                                              .add(GetMedicineByUser());
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
