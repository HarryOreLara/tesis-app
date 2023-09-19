class User {
  final String id;
  final String nombre;
  final String imgUrl;
  final bool isOnline;

  User(
      {required this.id,
      required this.nombre,
      required this.imgUrl,
      required this.isOnline});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"] ?? '',
      nombre: json["nombre"] ?? '',
      imgUrl: json["imgUrl"] ?? '',
      isOnline: json["isOnline"] ?? false);

  Map<String, dynamic> toJson() {
    return {'id': id, 'nombre': nombre, 'imgUrl': imgUrl, 'isOnline': isOnline};
  }
}


