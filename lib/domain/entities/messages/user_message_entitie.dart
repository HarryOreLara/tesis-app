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

//YO
final User currentUser =
    User(id: 'idHarry', nombre: 'Harry', imgUrl: '', isOnline: true);

//OTROS
final User elisaUser =
    User(id: 'idElisa', nombre: 'Elisa', imgUrl: '', isOnline: true);
final User luisUser =
    User(id: 'idLuis', nombre: 'Luis', imgUrl: '', isOnline: false);
final User johanUser =
    User(id: 'idJohan', nombre: 'Johan', imgUrl: '', isOnline: true);
final User arlesUser =
    User(id: 'idArles', nombre: 'Arles', imgUrl: '', isOnline: false);
