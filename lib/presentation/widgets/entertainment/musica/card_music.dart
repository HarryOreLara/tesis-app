import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tesis_app/domain/entities/entertainment/musica_entitie.dart';

class CardMusic extends StatelessWidget {
  const CardMusic({
    super.key,
    required this.musica,
  });

  final Musica musica;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        context.go('/music/onemusic');
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            width: size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: AssetImage(musica.coverUrl), fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 50.0,
            width: size.width * 0.37,
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        musica.title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        musica.description,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  )
                ]),
          ),
        ]),
      ),
    );
  }
}
