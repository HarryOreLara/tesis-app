import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/domain/entities/jokes_entitie.dart';
import 'package:tesis_app/domain/entities/votos_entitie.dart';

class JokesScreen extends StatelessWidget {
  static const String name = 'jokes_screen';
  const JokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chistes'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/entertainment');
            },
            icon:const Icon(Icons.arrow_back_ios)),
      ),
      body: const _ChistesScreen(),
    );
  }
}

class _ChistesScreen extends StatefulWidget {
  const _ChistesScreen({super.key});

  @override
  State<_ChistesScreen> createState() => __ChistesScreenState();
}

class __ChistesScreenState extends State<_ChistesScreen> {
  int currentIndex = 0;
  late Future<Joke> jokeFromApi;
  String currentJokeId = '';

  int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  Future<Joke> probandoGet() async {
    final dio = Dio();
    final numera = generateRandomNumber(1, 30);
    final url = 'https://tesis-xz3b.onrender.com/joke/getOneNum/$numera';
    final response = await dio.get(url);

    final jsonData = response.data as Map<String, dynamic>;
    final jokeList = jsonData['joke'] as List<dynamic>;
    final firstJoke = jokeList.first as Map<String, dynamic>;

    final votitos = Votos(
        likes: firstJoke['votos']['likes'],
        dislikes: firstJoke['votos']['dislikes']);

    final joke = Joke(
        votos: votitos,
        id: firstJoke['_id'] ?? '',
        contenido: firstJoke['contenido'] ?? '',
        categoria: firstJoke['categoria'] ?? '',
        autor: firstJoke['autor'] ?? '',
        nivelDificultad: firstJoke['nivelDificultad'] ?? '',
        idioma: firstJoke['idioma'] ?? '',
        popularidad: firstJoke['popularidad'] ?? '',
        fuente: firstJoke['fuente'] ?? '',
        imagenUrl: firstJoke['imagenUrl'],
        numeroDocumento: firstJoke['numeroDocumento'] ?? '',
        createdAt: DateTime.parse(firstJoke['createdAt']!),
        v: firstJoke['v'] ?? 0);

    return joke;
  }

  void cargarNuevoChiste() {
    setState(() {
      jokeFromApi = probandoGet();
    });
  }

  @override
  void initState() {
    super.initState();
    jokeFromApi = probandoGet();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Joke>(
              future: jokeFromApi,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return const Text('Error al obtener el chiste');
                }

                if (!snapshot.hasData) {
                  return const Text('No hay datos');
                }

                final joke = snapshot.data!;
                currentJokeId = joke.id;
                return Text(
                  joke.contenido,
                  style: const TextStyle(fontSize: 35),
                  textAlign: TextAlign.center,
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    cargar('likes', currentJokeId);
                    cargarNuevoChiste();
                  },
                  child: const Text('Like'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    cargar('dislikes', currentJokeId);
                    cargarNuevoChiste();
                  },
                  child: const Text('Dislike'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void cargar(String seleccion, String id) async {
  final dio = Dio();
  final url = 'https://tesis-xz3b.onrender.com/voto/$seleccion/$id';
  await dio.post(url);
}