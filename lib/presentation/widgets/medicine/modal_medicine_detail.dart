import 'package:flutter/material.dart';
import 'package:tesis_app/config/constants/medicines/medicines_contant.dart';

class ModalMedicineDetail extends StatelessWidget {
  const ModalMedicineDetail({super.key, 
    required this.size,
    required this.itemMedicine,
  });

  final Size size;
  final MedicinesConstant itemMedicine;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: size.width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            size: 50,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(itemMedicine.nombre),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cerrar'))
        ],
      ),
    );
  }
}
