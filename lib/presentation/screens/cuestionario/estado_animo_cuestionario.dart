import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EstadoAnimoScreen extends StatefulWidget {
  const EstadoAnimoScreen({super.key});

  @override
  State<EstadoAnimoScreen> createState() => _EstadoAnimoScreenState();
}

class _EstadoAnimoScreenState extends State<EstadoAnimoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estado de animo"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
    );
  }
}
