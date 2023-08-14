import 'package:flutter/material.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _PrincipalInterface(),
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
          ),
          CardsSecond(
            nombreCard: 'Medicamentos',
            ruta: '/medicines',
          )
        ]),
        SizedBox(
          height: 16.0,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CardsSecond(
            nombreCard: 'Diversion',
            ruta: '/entertainment',
          ),
          CardsSecond(
            nombreCard: 'Foro',
            ruta: '/forum',
          )
        ]),
        SizedBox(
          height: 16.0,
        ),
        Center(
            child: CardsSecond(
          nombreCard: 'Asistente',
          ruta: '/assistant',
        )),
      ],
    );
  }
}
