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
          child: Column(
            children: [
              SizedBox(
                width: 380,
                height: 200,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                        'https://images.genial.ly/5e6aa17fecdda90fc9f1bac2/b96c74ba-a2dc-4794-87c2-3c4c03b930e4.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Buen dia, Feliciana',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
