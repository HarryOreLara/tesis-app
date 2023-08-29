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
      ),
      body: _GameListScreen(),
    );
  }
}

class _GameListScreen extends StatelessWidget {
  final List<Map<String, String>> games = [
    {'title': 'Pareja', 'subtitle': 'Un juego clasico de encontrar la pareja'},
    {'title': 'rompecabeza', 'subtitle': 'A legendary RPG by Square Enix'},
    {
      'title': 'busqueda',
      'subtitle': 'Build, explore, and survive in a blocky world'
    },
    {
      'title': 'refran',
      'subtitle': 'Build, explore, and survive in a blocky world'
    }
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
              // Acción al tocar una tarjeta (puedes agregar navegación o acciones aquí)
              print('Tocaste ${games[index]['title']}');
              // print('/${games[index]['title']}');
              context.go(
                  '/minigames/${games[index]['title']}'); //CRUCIAL NO BORRAR NUNCA
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
