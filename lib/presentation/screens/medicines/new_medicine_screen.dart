import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tesis_app/config/constants/medicines/medicines_contant.dart';

class Medicamento {
  String nombre = '';
  TimeOfDay horaInicio = TimeOfDay.now();
  TimeOfDay horaIntermedio = TimeOfDay.now();
  TimeOfDay horaFin = TimeOfDay.now();
  int cantidad = 0;
}

class NewMedicineScreen extends StatelessWidget {
  static const String name = 'newMedicine_screen';
  const NewMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Medicamento _medicamento = Medicamento();

    return FadeInDown(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Nuevo Medicamento'),
            centerTitle: true,
          ),
          body: _FormMedicamento(medicamento: _medicamento)),
    );
  }
}

class _FormMedicamento extends StatefulWidget {
  const _FormMedicamento({
    super.key,
    required Medicamento medicamento,
  }) : _medicamento = medicamento;

  final Medicamento _medicamento;

  @override
  State<_FormMedicamento> createState() => _FormMedicamentoState();
}

class _FormMedicamentoState extends State<_FormMedicamento> {
    final _formKey = GlobalKey<FormState>();

    void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Guardar los datos o realizar acciones necesarias
      print('Medicamento registrado:');
      print('Nombre: ${widget._medicamento.nombre}');
      print('Hora de Inicio: ${widget._medicamento.horaInicio}');
      print('Hora de Fin: ${widget._medicamento.horaFin}');
      print('Cantidad: ${widget._medicamento.cantidad}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Nombre del medicamento'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa el nombre del medicamento';
                }
                return null;
              },
              onSaved: (newValue) => widget._medicamento.nombre = newValue!,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Hora de Inicio'),
              onTap: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: widget._medicamento.horaInicio,
                );
                if (selectedTime != null) {
                  setState(() {
                    widget._medicamento.horaInicio = selectedTime;
                  });
                }
              },
              readOnly: true,
              controller: TextEditingController(
                text: widget._medicamento.horaInicio.format(context),
              ),
            ),
            //Hora intermedia
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Hora de Intermedia'),
              onTap: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: widget._medicamento.horaIntermedio,
                );
                if (selectedTime != null) {
                  setState(() {
                    widget._medicamento.horaIntermedio = selectedTime;
                  });
                }
              },
              readOnly: true,
              controller: TextEditingController(
                text: widget._medicamento.horaIntermedio.format(context),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Hora de Fin'),
              onTap: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: widget._medicamento.horaFin,
                );
                if (selectedTime != null) {
                  setState(() {
                    widget._medicamento.horaFin = selectedTime;
                  });
                }
              },
              readOnly: true,
              controller: TextEditingController(
                text: widget._medicamento.horaFin.format(context),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Cantidad de Medicamentos'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa la cantidad de medicamentos.';
                }
                return null;
              },
              onSaved: (value) =>
                  widget._medicamento.cantidad = int.parse(value!),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Registrar Medicamento'),
            ),
          ],
        ),
      ),
    );
  }
}
