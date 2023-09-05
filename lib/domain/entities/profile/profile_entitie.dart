class Profile {
  final String nombre;
  final String apellidos;
  final String edad;
  final String genero;
  final String dni;

  Profile(
      {required this.nombre,
      required this.apellidos,
      required this.edad,
      required this.genero,
      required this.dni});

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'apellidos': apellidos,
      'edad': edad,
      'genero': genero,
      'dni': dni
    };
  }
}
