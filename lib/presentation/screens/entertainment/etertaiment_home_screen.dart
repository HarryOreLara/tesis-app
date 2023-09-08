import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/widgets/entertainment/diversion_slidershow.dart';

class EntertainmentScreen extends StatelessWidget {
  static const String name = 'entertainment_screen';
  const EntertainmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entretenimiento'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/home');
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: const DiversionSlider(),
    );
  }
}
