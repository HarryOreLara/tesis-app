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
        child: const Card(
          color: Color.fromARGB(255, 74, 206, 254),
          elevation: 4,
          shadowColor: Colors.amber,
          child: Column(
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
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
