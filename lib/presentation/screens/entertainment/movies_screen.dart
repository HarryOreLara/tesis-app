import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesScreen extends StatelessWidget {
  static const String name = 'movies_screen';

  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/entertainment');
            },
            icon:const Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
