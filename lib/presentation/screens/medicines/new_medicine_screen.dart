import 'package:flutter/material.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class NewMedicineScreen extends StatelessWidget {
  static const String name = 'newMedicine_screen';
  const NewMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 205, 255),
        elevation: 3,
        title: const Text('Nuevo Medicamento'),
        centerTitle: true,
      ),
      body: const FormMedicine(),
    );
  }
}
