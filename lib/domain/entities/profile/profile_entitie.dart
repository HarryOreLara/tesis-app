class Profile {
  final String id;
  final String nombre;
  final String apellidos;
  final String edad;
  final String genero;
  final String dni;
  final String idUsuario;

  Profile(
      {required this.idUsuario,
      required this.id,
      required this.nombre,
      required this.apellidos,
      required this.edad,
      required this.genero,
      required this.dni});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
      id: json["_id"] ?? '',
      nombre: json["nombre"] ?? '',
      apellidos: json["apellidos"] ?? '',
      edad: json["edad"] ?? '',
      genero: json["genero"] ?? '',
      dni: json["dni"] ?? '',
      idUsuario: json["idUsuario"] ?? '');

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'apellidos': apellidos,
      'edad': edad,
      'genero': genero,
      'dni': dni,
      'idUsuario': idUsuario
    };
  }
}
