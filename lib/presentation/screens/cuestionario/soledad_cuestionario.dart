import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SoledadCuestionarioScreen extends StatelessWidget {
  static const String name = 'soledad_cuestionario_screen';

  const SoledadCuestionarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preguntas iniciales"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/cuestionario');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
