class EntertainmentConstant {
  final String idEntertainment;
  final String nombre;
  final String ruta;
  final String imagen;

  const EntertainmentConstant(
      {required this.idEntertainment,
      required this.nombre,
      required this.ruta,
      required this.imagen});
}

const itemsEntertainmentConstant = <EntertainmentConstant>[
  EntertainmentConstant(
      nombre: 'Minijuegos',
      idEntertainment: '2',
      ruta: '/minigames',
      imagen:
          'assets/images/minigames.png'),
  EntertainmentConstant(
      nombre: 'Chistes',
      idEntertainment: '4',
      ruta: '/jokes',
      imagen:
          'assets/images/jokes.png'),
];
