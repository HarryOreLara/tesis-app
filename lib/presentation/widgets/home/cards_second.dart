import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardsSecond extends StatelessWidget {
  final String nombreCard;
  final String ruta;

  const CardsSecond({
    super.key,
    required this.nombreCard,
    required this.ruta,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ruta);
      },
      child: Card(
        child: Column(children: [
          const SizedBox(
            width: 183,
            height: 131,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/entertainment.jpg'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(nombreCard),
          )
        ]),
      ),
    );
  }
}
