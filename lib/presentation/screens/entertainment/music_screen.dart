import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/domain/entities/musica_entitie.dart';
import 'package:tesis_app/domain/entities/play_list_entitite.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';
// import 'package:audioplayers/audioplayers.dart';

class MusicScreen extends StatelessWidget {
  static const String name = 'music_screen';

  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<Musica> musicas = Musica.musicas;
    List<PlayList> playLists = PlayList.playlists;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: const _CustomAppbar(),
        bottomNavigationBar: const _CustomNavbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _BuscadorMusica(),
              _SlideCards(size: size, musicas: musicas),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SeccionHeader(title: 'Lista de Musica'),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: playLists.length,
                      itemBuilder: (context, index) {
                        return PlayListCard(playList: playLists[index]);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        //body: MusicPlayerScreen(),
      ),
    );
  }
}

class _SlideCards extends StatelessWidget {
  const _SlideCards({
    required this.size,
    required this.musicas,
  });

  final Size size;
  final List<Musica> musicas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SeccionHeader(title: 'Lo mas nuevo'),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: musicas.length,
              itemBuilder: (context, index) {
                return CardMusic(musica: musicas[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _BuscadorMusica extends StatelessWidget {
  const _BuscadorMusica();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenido',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            'Disfruta de tu musica favortia',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Buscar',
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey.shade400),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none)),
          )
        ],
      ),
    );
  }
}

class _CustomNavbar extends StatelessWidget {
  const _CustomNavbar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined), label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_fill_outlined), label: 'Play'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), label: 'Perfil'),
        ]);
  }
}

class _CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppbar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/perfil.webp'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
