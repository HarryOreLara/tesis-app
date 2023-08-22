import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tesis_app/presentation/providers/entertainment/jokes_provider.dart';

class JokesScreen extends StatelessWidget {
  static const String name = 'jokes_screen';
  const JokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chistes'),
        centerTitle: true,
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
  late Future<String> jokeFromApi;

  int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  Future<String> probandoGet() async {
    final dio = Dio();
    final numera = generateRandomNumber(1, 30);
    final url = 'https://tesis-xz3b.onrender.com/joke/getOneNum/$numera';
    final response = await dio.get(url);

    final jsonData = response.data as Map<String, dynamic>;
    final jokeList = jsonData['joke'] as List<dynamic>;
    final firstJoke = jokeList.first as Map<String, dynamic>;
    final contenido = firstJoke['contenido'] as String;

    return contenido;
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
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder<String>(
            future: jokeFromApi,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return Text(
                  snapshot.data!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                );
              } else if (snapshot.hasError) {
                return const Text(
                  'Error al obtener el chiste',
                  style: TextStyle(color: Colors.red),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  cargar('like');
                  cargarNuevoChiste();
                },
                child: const Text('Like'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  cargar('dislike');
                  cargarNuevoChiste();
                },
                child: const Text('Dislike'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void cargar(String seleccion) {
  print(seleccion);
}
