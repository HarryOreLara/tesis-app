import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  static const String name = 'music_screen';

  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Musica'),
        centerTitle: true,
      ),
    );
  }
}