import 'package:flutter/material.dart';


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
    );
  }
}