import 'package:flutter/material.dart';

class BuscaminasScreen extends StatefulWidget {
  const BuscaminasScreen({super.key});

  @override
  State<BuscaminasScreen> createState() => _BuscaminasScreenState();
}

class _BuscaminasScreenState extends State<BuscaminasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscaminas"),
        centerTitle: true,
      ),
    );
  }
}
