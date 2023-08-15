class MedicinesConstant {
  final String idMedicine;
  final String nombre;
  final String? horaInicio;
  final String? horaIntermedio;
  final String? horaFin;
  final int cantidadMedicamentos;

  const MedicinesConstant({
    required this.idMedicine,
    required this.nombre,
    required this.horaInicio,
    required this.horaIntermedio,
    required this.horaFin,
    required this.cantidadMedicamentos,
  });
}

const itemsMedicineConstant = <MedicinesConstant>[
  MedicinesConstant(
      nombre: 'Amoxicilina',
      horaInicio: '08:00',
      horaIntermedio: '14:00',
      horaFin: '20:00',
      cantidadMedicamentos: 1,
      idMedicine: '1'),
  MedicinesConstant(
      nombre: 'Amoxicilina',
      horaInicio: '08:00',
      horaIntermedio: '14:00',
      horaFin: '20:00',
      cantidadMedicamentos: 3,
      idMedicine: '2'),
  MedicinesConstant(
      idMedicine: '3',
      nombre: 'Clorfenamina',
      horaInicio: '08:00',
      horaIntermedio: '14:00',
      horaFin: '20:00',
      cantidadMedicamentos: 2),
  MedicinesConstant(
      idMedicine: '4',
      nombre: 'Paracetamol',
      horaInicio: '08:00',
      horaIntermedio: '14:00',
      horaFin: '20:00',
      cantidadMedicamentos: 1),
  MedicinesConstant(
      idMedicine: '5',
      nombre: 'Aspirina',
      horaInicio: '08:00',
      horaIntermedio: '14:00',
      horaFin: '20:00',
      cantidadMedicamentos: 2),
  MedicinesConstant(
      idMedicine: '6',
      nombre: 'Aspirina',
      horaInicio: '08:00',
      horaIntermedio: '',
      horaFin: '20:00',
      cantidadMedicamentos: 2),
  MedicinesConstant(
      idMedicine: '7',
      nombre: 'Aspirina',
      horaInicio: '08:00',
      horaIntermedio: '14:00',
      horaFin: '20:00',
      cantidadMedicamentos: 2),
];
