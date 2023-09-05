class MedicineList {
  //MobieMobieDB
  final String id;
  final String nombre;
  final String cantidadMedicamentos;
  final String horaInicio;
  final String horaIntermedio;
  final String horaFin;

  MedicineList({
    required this.id,
    required this.nombre,
    required this.cantidadMedicamentos,
    required this.horaInicio,
    required this.horaIntermedio,
    required this.horaFin,
  });

  factory MedicineList.fromJson(Map<String, dynamic> json) => MedicineList(
        id: json["_id"] ?? '',
        nombre: json["nombre"] ?? '',
        cantidadMedicamentos: json["cantidadMedicamentos"] ?? '',
        horaInicio: json["horaInicio"] ?? '',
        horaIntermedio: json["horaIntermedio"] ?? '',
        horaFin: json["horaFin"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "cantidadMedicamentos": cantidadMedicamentos,
        "horaInicio": horaInicio,
        "horaIntermedio": horaIntermedio,
        "horaFin": horaFin,
      };
}
