class MedicinesConstant {
  final String nombre;
  final String? horaInicio;
  final String? horaIntermedio;
  final String? horaFin;
  final int cantidadMedicamentos;

  const MedicinesConstant({
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
      cantidadMedicamentos: 2),
  MedicinesConstant(
      nombre: 'Clorfenamina',
      horaInicio: '08:00',
      horaIntermedio: '14:00',
      horaFin: '20:00',
      cantidadMedicamentos: 2),
  MedicinesConstant(
      nombre: 'Paracetamol',
      horaInicio: '08:00',
      horaIntermedio: '14:00',
      horaFin: '20:00',
      cantidadMedicamentos: 2),
  MedicinesConstant(
      nombre: 'Aspirina',
      horaInicio: '08:00',
      horaIntermedio: '14:00',
      horaFin: '20:00',
      cantidadMedicamentos: 2),
];
