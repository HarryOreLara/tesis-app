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
  // EntertainmentConstant(
  //     nombre: 'Videos',
  //     idEntertainment: '1',
  //     ruta: '/videos',
  //     imagen:
  //         'https://img.freepik.com/vector-premium/logotipo-corte-pelicula-concepto-pelicula-tijeras_759725-352.jpg?w=2000'),
  EntertainmentConstant(
      nombre: 'Minijuegos',
      idEntertainment: '2',
      ruta: '/minigames',
      imagen:
          'https://img.freepik.com/free-vector/retro-gaming-poster-template_23-2148800296.jpg?w=2000'),
  // EntertainmentConstant(
  //     nombre: 'Musica',
  //     idEntertainment: '3',
  //     ruta: '/music',
  //     imagen:
  //         'https://yt3.googleusercontent.com/ytc/AOPolaRjDGRAirY8mVsWNKt75HUglcd8sDs85NRoJgVxrQ=s900-c-k-c0x00ffffff-no-rj'),
  EntertainmentConstant(
      nombre: 'Chistes',
      idEntertainment: '4',
      ruta: '/jokes',
      imagen:
          'https://img.freepik.com/vector-gratis/dibujado-mano-ilustracion-dia-mundial-libertad-prensa_23-2148904426.jpg'),
  // EntertainmentConstant(
  //     nombre: 'Peliculas',
  //     idEntertainment: '5',
  //     ruta: '/movies',
  //     imagen:
  //         'https://img.freepik.com/vector-gratis/logotipo-produccion-cine-creativo_23-2149509983.jpg'),
];
