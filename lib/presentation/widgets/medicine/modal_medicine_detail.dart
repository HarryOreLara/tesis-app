import 'package:flutter/material.dart';
import 'package:tesis_app/config/constants/medicines/medicines_contant.dart';
import 'package:tesis_app/domain/entities/medicine_entitie.dart';

class ModalMedicineDetail extends StatelessWidget {
  const ModalMedicineDetail({
    super.key,
    required this.size,
    required this.itemMedicine,
  });

  final Size size;
  final Medicine itemMedicine;

  @override
  Widget build(BuildContext context) {
    final String horaMedia =
        "la segunda pastilla se debe tomar a las ${itemMedicine.horaIntermedio} ";
    return SizedBox(
      height: 400,
      width: size.width * 1,
      child: Column(
        children: [
          SizedBox(
            width: size.width * 1.0,
            child: Center(
              child: Text(
                itemMedicine.nombre,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                SizedBox(
                  width: size.width * 0.45,
                  child: Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'Horario',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'La primera pastilla se debe tomar en la hora ${itemMedicine.horaInicio} am, ${itemMedicine.horaIntermedio == "" ? '' : horaMedia} y la ultima se debe tomar a las ${itemMedicine.horaFin}',
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
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'La cantidad de pastillas que se debe de tomar en la hora especifica son ${itemMedicine.cantidadMedicamentos}',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Actualizar medicamento')),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Eliminar medicamento')),
              )
            ],
          )
        ],
      ),
    );
  }
}
