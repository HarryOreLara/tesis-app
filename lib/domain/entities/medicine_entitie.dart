class Medicine {
  final String id;
  final String nombre;
  final String cantidadMedicamentos;
  final String horaInicio;
  final String horaIntermedio;
  final String horaFin;

  Medicine(
    {
    required this.id,
    required this.nombre,
    required this.cantidadMedicamentos,
    required this.horaInicio,
    required this.horaIntermedio,
    required this.horaFin,
  });

  Map<String, dynamic> toJson() {
    return {
      "nombre": nombre,
      "cantidadMedicamentos": cantidadMedicamentos,
      "horaInicio": horaInicio,
      "horaIntermedio": horaIntermedio,
      "horaFin": horaFin
    };
  }
}
