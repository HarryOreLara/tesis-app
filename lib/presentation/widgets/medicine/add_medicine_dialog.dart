import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_model.dart';
import 'package:tesis_app/presentation/bloc/medicines/medicine_bloc.dart';

class AddMedicineDialog extends StatefulWidget {
  final TextEditingController nombreController;
  final TextEditingController cantidadController;

  const AddMedicineDialog({
    super.key,
    required this.nombreController,
    required this.cantidadController,
  });

  @override
  State<AddMedicineDialog> createState() => _AddMedicineDialogState();
}

class _AddMedicineDialogState extends State<AddMedicineDialog> {
  TimeOfDay? selectedHoraInicio;
  bool isHoraInicioSelected = false;

  TimeOfDay? selectedHoraFin;
  bool isHoraFinSelected = false;

  TimeOfDay? selectedHoraIntermedia;
  bool isHoraIIntermediaSelected = false;

  DateTime selectedDate = DateTime.now();
  bool isDateSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineBloc, MedicineState>(
      builder: (context, state) {
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: widget.nombreController,
                    decoration: const InputDecoration(
                        labelText: 'Nombre de la medicina'),
                  ),
                  TextField(
                    controller: widget.cantidadController,
                    inputFormatters: [LengthLimitingTextInputFormatter(15)],
                    decoration: const InputDecoration(
                        labelText: 'Cantidad de pastillas a tomar'),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final newTime = await showTimePicker(
                        context: context,
                        initialTime: selectedHoraInicio ?? TimeOfDay.now(),
                      );

                      if (newTime != null && newTime != selectedHoraInicio) {
                        setState(() {
                          selectedHoraInicio = newTime;
                          isHoraInicioSelected = true;
                        });
                      }
                    },
                    label: Text(
                      isHoraInicioSelected
                          ? 'Hora seleccionada: ${selectedHoraInicio!.format(context)}'
                          : 'Ingrese hora de inicio',
                    ),
                    icon: const Icon(Icons.date_range),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final newTime = await showTimePicker(
                        context: context,
                        initialTime: selectedHoraIntermedia ?? TimeOfDay.now(),
                      );

                      if (newTime != null &&
                          newTime != selectedHoraIntermedia) {
                        setState(() {
                          selectedHoraIntermedia = newTime;
                          isHoraIIntermediaSelected = true;
                        });
                      }
                    },
                    label: Text(
                      isHoraIIntermediaSelected
                          ? 'Hora seleccionada: ${selectedHoraIntermedia!.format(context)}'
                          : 'Ingrese hora intermedia',
                    ),
                    icon: const Icon(Icons.date_range),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final newTime = await showTimePicker(
                        context: context,
                        initialTime: selectedHoraFin ?? TimeOfDay.now(),
                      );

                      if (newTime != null && newTime != selectedHoraFin) {
                        setState(() {
                          selectedHoraFin = newTime;
                          isHoraFinSelected = true;
                        });
                      }
                    },
                    label: Text(
                      isHoraFinSelected
                          ? 'Hora seleccionada: ${selectedHoraFin!.format(context)}'
                          : 'Ingrese hora final',
                    ),
                    icon: const Icon(Icons.date_range),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final nombre = widget.nombreController.text.trim();
                      final cantidad = widget.cantidadController.text.trim();

                      String horaInicio = selectedHoraInicio != null
                          ? selectedHoraInicio!.format(context)
                          : "";
                      String horaIntermedia = selectedHoraIntermedia != null
                          ? selectedHoraIntermedia!.format(context)
                          : "";
                      String horaFin = selectedHoraFin != null
                          ? selectedHoraFin!.format(context)
                          : "";

                      MedicineModel medicine = MedicineModel(
                        id: "",
                        nombre: nombre,
                        cantidadMedicamentos: cantidad,
                        horaInicio: horaInicio,
                        horaIntermedio: horaIntermedia,
                        horaFin: horaFin,
                      );

                      context
                          .read<MedicineBloc>()
                          .add(CreatedMedicine(medicine: medicine));

                      Navigator.pop(context);
                    },
                    child: const Text('Guardar Medicina'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
