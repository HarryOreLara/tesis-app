import 'package:flutter/material.dart';

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
    );
  }
}
