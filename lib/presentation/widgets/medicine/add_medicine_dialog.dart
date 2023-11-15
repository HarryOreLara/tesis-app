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
  final _formKey = GlobalKey<FormState>();
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                        if (value.length >= 20) {
                          return 'El nombre tiene el tamaño correcto';
                        }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'El nombre contiene un numero, eliminelo';
                        }
                        return null;
                      },
                      controller: widget.nombreController,
                      decoration: const InputDecoration(
                          labelText: 'Nombre de la medicina'),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo es obligatorio';
                        }
                        if (value.length > 2 ||
                            !RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Escriba una cantidad válida';
                        }

                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Escriba solo números';
                        }

                        return null; // La validación pasó
                      },
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
                          initialTime:
                              selectedHoraIntermedia ?? TimeOfDay.now(),
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
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<MedicineBloc>()
                              .add(CreatedMedicine(medicine: medicine));

                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Guardar Medicina'),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
