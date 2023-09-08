import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardFirst extends StatelessWidget {
  final String nombreCard;
  final String ruta;

  const CardFirst({
    super.key,
    required this.nombreCard,
    required this.ruta,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.push(ruta);
        },
        child: Card(
          color: Colors.white,
          elevation: 4,
          shadowColor: const Color.fromARGB(255, 255, 255, 255),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.8),
                  const Color(0xFF003976),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: const Column(
              children: [
                SizedBox(
                  width: 380,
                  height: 200,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/perfil.webp'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Buen dia, Feliciana',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Color(0xff003976),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


