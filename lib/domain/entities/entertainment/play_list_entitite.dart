import 'package:tesis_app/domain/entities/entertainment/musica_entitie.dart';

class PlayList {
  final String title;
  final List<Musica> musicas;
  final String imageUrl;

  PlayList(
      {required this.title, required this.imageUrl, required this.musicas});

  static List<PlayList> playlists = [
    PlayList(
        title: 'Regaeton',
        imageUrl:
            'https://s1.ppllstatics.com/lasprovincias/www/multimedia/202112/12/media/cortadas/gatos-kb2-U160232243326NVC-1248x770@Las%20Provincias.jpg',
        musicas: Musica.musicas),
    PlayList(
        title: 'Baladas',
        imageUrl:
            'https://s1.ppllstatics.com/lasprovincias/www/multimedia/202112/12/media/cortadas/gatos-kb2-U160232243326NVC-1248x770@Las%20Provincias.jpg',
        musicas: Musica.musicas),
    PlayList(
        title: 'Boleros',
        imageUrl:
            'https://s1.ppllstatics.com/lasprovincias/www/multimedia/202112/12/media/cortadas/gatos-kb2-U160232243326NVC-1248x770@Las%20Provincias.jpg',
        musicas: Musica.musicas),
    PlayList(
        title: 'Huaynos',
        imageUrl:
            'https://s1.ppllstatics.com/lasprovincias/www/multimedia/202112/12/media/cortadas/gatos-kb2-U160232243326NVC-1248x770@Las%20Provincias.jpg',
        musicas: Musica.musicas),
  ];
}
