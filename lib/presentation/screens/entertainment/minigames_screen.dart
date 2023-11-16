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
    {'title': 'Pareja', 'subtitle': 'Un juego clasico de encontrar la pareja', 'ruta':'Pareja'},
    {
      'title': 'Rompecabeza',
      'subtitle': 'Arma el rompecabezas antes de complear el tiempo', 'ruta':'Rompecabeza'
    },
    {'title': 'Busqueda', 'subtitle': 'Busca cosas que te sugiere la app', 'ruta':'Busqueda'},
    {'title': 'Refran', 'subtitle': 'Completa el refran', 'ruta':'Refran'},
    {
      'title': 'Tres en Raya',
      'subtitle': 'Juega el fabuloso juego de tres en raya', 'ruta':'tresenraya'
    },
    {'title': 'Buscaminas', 'subtitle': 'Acierta los casilleros', 'ruta':'buscaminas'},
  ];
  //refran

  @override
  Widget build(BuildContext context) {
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
              child: ListTile(
                title: Text(
                  games[index]['title']!,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800),
                ),
                subtitle: Text(
                  games[index]['subtitle']!,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
