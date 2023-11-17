import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MinigamesScreen extends StatelessWidget {
  static const String name = 'minigames_screen';

  const MinigamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minijuegos'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/entertainment');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: _GameListScreen(),
    );
  }
}

class _GameListScreen extends StatelessWidget {
  final List<Map<String, String>> games = [
    {
      'title': 'Pareja',
      'subtitle': 'Un juego clasico de encontrar la pareja',
      'ruta': 'Pareja'
    },
    {
      'title': 'Tres en Raya',
      'subtitle': 'Juega el fabuloso juego de tres en raya',
      'ruta': 'tresenraya'
    },
    {
      'title': 'Buscaminas',
      'subtitle': 'Acierta los casilleros',
      'ruta': 'buscaminas'
    },
  ];
  //refran

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              context.push(
                  '/minigames/${games[index]['ruta']}'); //CRUCIAL NO BORRAR NUNCA
            },
            child: Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://ak.picdn.net/shutterstock/videos/1057714930/thumb/1.jpg'),
                          fit: BoxFit.fill)
                      // gradient: const LinearGradient(
                      //     colors: [Colors.blueAccent, Colors.blue])

                      ),
                  height: size.height * 0.15,
                  child: Center(
                      child: Text(
                    games[index]['title']!,
                    style: const TextStyle(
                        fontFamily: 'Gotham-Book',
                        fontSize: 35.0,
                        color: Colors.white),
                  )),
                )),
          );
        },
      ),
    );
  }

  //   @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: ListView.builder(
  //       itemCount: games.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return InkWell(
  //           onTap: () {
  //             context.push(
  //                 '/minigames/${games[index]['ruta']}'); //CRUCIAL NO BORRAR NUNCA
  //           },
  //           child: Card(
  //             elevation: 4,
  //             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //             child: ListTile(
  //               title: Text(
  //                 games[index]['title']!,
  //                 style: TextStyle(
  //                     fontSize: 25,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.blue.shade800),
  //               ),
  //               subtitle: Text(
  //                 games[index]['subtitle']!,
  //                 style: const TextStyle(fontSize: 18),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
