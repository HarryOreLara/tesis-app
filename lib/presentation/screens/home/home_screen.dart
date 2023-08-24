import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 119, 119, 119),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 124, 124, 124)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: const _PrincipalInterface(),
      ),
    );
  }
}

class _PrincipalInterface extends StatelessWidget {
  const _PrincipalInterface();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CardFirst(nombreCard: 'profile', ruta: '/profile'),
        SizedBox(
          height: 20.0,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CardsSecond(
            nombreCard: 'Mensajes',
            ruta: '/message',
            colorsList: [
              Color.fromARGB(255, 18, 255, 164),
              Color.fromARGB(255, 34, 34, 34)
            ],
          ),
          CardsSecond(
            nombreCard: 'Medicamentos',
            ruta: '/medicines',
            colorsList: [
              Color.fromARGB(255, 255, 0, 0),
              Color.fromARGB(255, 34, 34, 34)
            ],
          )
        ]),
        SizedBox(
          height: 16.0,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CardsSecond(
            nombreCard: 'Diversion',
            ruta: '/entertainment',
            colorsList: [
              Color.fromARGB(255, 179, 255, 0),
              Color.fromARGB(255, 0, 0, 0)
            ],
          ),
          CardsSecond(
            nombreCard: 'Foro',
            ruta: '/forum',
            colorsList: [
              Color.fromARGB(255, 0, 132, 255),
              Color.fromARGB(255, 0, 0, 0)
            ],
          )
        ]),
        SizedBox(
          height: 16.0,
        ),
        Center(
            child: CardsSecond(
          nombreCard: 'Asistente',
          ruta: '/assistant',
          colorsList: [Color.fromARGB(255, 255, 0, 119), Color(0xFF000000)],
        )),
      ],
    );
  }
}
