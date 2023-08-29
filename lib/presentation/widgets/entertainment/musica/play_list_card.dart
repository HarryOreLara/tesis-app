import 'package:flutter/material.dart';

import 'package:tesis_app/domain/entities/play_list_entitite.dart';

class PlayListCard extends StatelessWidget {
  const PlayListCard({
    super.key,
    required this.playList,
  });

  final PlayList playList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO
        //Get.toNamed('/playlist', arguments: playList);
        print('Navegando a la playlist');
      },
      child: Container(
        height: 75,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade800.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                playList.imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playList.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    '${playList.musicas.length} musicas',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
