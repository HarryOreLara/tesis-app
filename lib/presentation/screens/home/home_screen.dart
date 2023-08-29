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
            colors: [Color(0xFF008FD5), Color(0xff003976)],
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
      children: [
        const CardFirst(nombreCard: 'profile', ruta: '/profile'),
        const SizedBox(
          height: 20.0,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CardsSecond(
            nombreCard: 'Mensajes',
            ruta: '/message',
            colorsList: [
              Colors.white.withOpacity(0.8),
              const Color(0xff008FD5).withOpacity(0.5),
            ],
          ),
          CardsSecond(
            nombreCard: 'Medicamentos',
            ruta: '/medicines',
            colorsList: [
              Colors.white.withOpacity(0.8),
              const Color(0xff008FD5).withOpacity(0.5),
            ],
          )
        ]),
        const SizedBox(
          height: 16.0,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CardsSecond(
            nombreCard: 'Diversion',
            ruta: '/entertainment',
            colorsList: [
              Colors.white.withOpacity(0.8),
              const Color(0xff008FD5).withOpacity(0.5),
            ],
          ),
          CardsSecond(
            nombreCard: 'Foro',
            ruta: '/forum',
            colorsList: [
              // Color.fromARGB(255, 255, 255, 255),
              // Color.fromARGB(255, 255, 255, 255)
              Colors.white.withOpacity(0.8),
              const Color(0xff008FD5).withOpacity(0.5),
            ],
          )
        ]),
        const SizedBox(
          height: 16.0,
        ),
        Center(
            child: CardsSecond(
          nombreCard: 'Asistente',
          ruta: '/assistant',
          colorsList: [
            Colors.white.withOpacity(0.8),
            const Color(0xff008FD5).withOpacity(0.5),
          ],
        )),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
