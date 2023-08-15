import 'package:flutter/material.dart';

class OneMedicineScreen extends StatelessWidget {
  static const String name = 'OneMedicine_Screen';
  final String idMedicine;

  const OneMedicineScreen({super.key, required this.idMedicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicina'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(idMedicine),
      ),
    );
  }
}
