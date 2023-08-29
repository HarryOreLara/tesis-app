class Musica {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Musica(
      {required this.title,
      required this.description,
      required this.url,
      required this.coverUrl});

  static List<Musica> musicas = [
    Musica(
        title: 'Adictiva',
        description: 'Anuel AA',
        url: 'assets/music/url/adictiva.mp3',
        coverUrl: 'assets/music/images/adictiva.jpg'),
    Musica(
        title: 'Donde',
        description: 'Glass',
        url: 'assets/music/url/dondevaamor.mp3',
        coverUrl: 'assets/music/images/adictiva.jpg'),
    Musica(
        title: 'Enterraw',
        description: 'Jhay Cortez',
        url: 'assets/music/url/enterraw.mp3',
        coverUrl: 'assets/music/images/enterraw.jpg'),
    Musica(
        title: 'z',
        description: 'Anuel AA - Bat Bony',
        url: 'assets/music/url/ultimavez.mp3',
        coverUrl: 'assets/music/images/adictiva.jpg'),
  ];
}
