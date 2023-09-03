import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardsSecond extends StatelessWidget {
  final String nombreCard;
  final String ruta;
  final List<Color> colorsList;

  const CardsSecond({
    super.key,
    required this.nombreCard,
    required this.ruta,
    required this.colorsList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.push(ruta);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                colors: colorsList,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 183,
                  height: 131,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          AssetImage('assets/images$ruta.jpg'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    nombreCard,
                    style: const TextStyle(
                      color: Color(0xFF0077BF),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
