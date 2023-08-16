import 'package:flutter/material.dart';

class FormMedicine extends StatefulWidget {
  const FormMedicine({super.key});

  @override
  State<FormMedicine> createState() => _FormMedicineState();
}

class _FormMedicineState extends State<FormMedicine> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          //Image.asset(''),
          const SizedBox(
            height: 20,
          ),
          const _InputMedicine(nameLabel: 'Nombre de Medicamento'),
          const SizedBox(
            height: 10,
          ),
          const _InputMedicine(nameLabel: 'Cantidad de pastillas a tomar'),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.5,
                child: const _InputMedicine(nameLabel: 'Hora de Inicio'),
              ),
              SizedBox(
                width: size.width * 0.5,
                child: const _InputMedicine(
                  nameLabel: 'Hora Fin',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _InputMedicine extends StatelessWidget {
  final String nameLabel;
  const _InputMedicine({required this.nameLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        style: const TextStyle(fontSize: 20),
        decoration:
            InputDecoration(label: Text(nameLabel), border: InputBorder.none),
      ),
    );
  }
}
