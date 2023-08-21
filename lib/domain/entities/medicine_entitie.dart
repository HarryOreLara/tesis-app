class Medicine {
  final String id;
  final String nombre;
  final int cantidadMedicamentos;
  final String horaInicio;
  final String horaIntermedio;
  final String horaFin;
  final String creator;
  final DateTime createdAt;
  final int v;

  Medicine({
    required this.id,
    required this.nombre,
    required this.cantidadMedicamentos,
    required this.horaInicio,
    required this.horaIntermedio,
    required this.horaFin,
    required this.creator,
    required this.createdAt,
    required this.v,
  });
}
