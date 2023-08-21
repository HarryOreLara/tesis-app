class MedicineList {//MobieMobieDB
    final String id;
    final String nombre;
    final int cantidadMedicamentos;
    final String horaInicio;
    final String horaIntermedio;
    final String horaFin;
    final String creator;
    final DateTime createdAt;
    final int v;

    MedicineList({
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

    factory MedicineList.fromJson(Map<String, dynamic> json) => MedicineList(
        id: json["_id"] ?? '',
        nombre: json["nombre"] ?? '',
        cantidadMedicamentos: json["cantidadMedicamentos"] ?? '',
        horaInicio: json["horaInicio"] ?? '',
        horaIntermedio: json["horaIntermedio"] ?? '',
        horaFin: json["horaFin"] ?? '',
        creator: json["creator"] ?? '',
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "cantidadMedicamentos": cantidadMedicamentos,
        "horaInicio": horaInicio,
        "horaIntermedio": horaIntermedio,
        "horaFin": horaFin,
        "creator": creator,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}
