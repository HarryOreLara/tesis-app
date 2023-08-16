import 'package:flutter/material.dart';
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
      ),
      body:const DiversionSlider(),
    );
  }
}
