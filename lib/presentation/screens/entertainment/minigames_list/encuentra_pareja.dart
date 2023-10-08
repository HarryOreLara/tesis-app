import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:go_router/go_router.dart';

class ParejaMinigameScreen extends StatelessWidget {
  const ParejaMinigameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encuentra a la pareja'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/minigames');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: const MemoryGame(),
    );
  }
}

class CardItem {
  final int id;
  final String image;

  CardItem(this.id, this.image);
}

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});

  @override
   MemoryGameState createState() =>  MemoryGameState();
}

class  MemoryGameState extends State<MemoryGame> {
  List<CardItem> cards = [];
  List<CardItem> flippedCards = [];
  bool isFlipping = false;
  int attempts = 0;

  void initializeGame() {
    // Preparar tarjetas duplicadas
    List<String> images = [
      '🐶',
      '🐱',
      '🐰',
      '🐢',
      '🦄',
      '🦜',
      '🐍',
      '🦐',
    ];

    List<CardItem> allCards = [];
    for (String image in images) {
      allCards.add(CardItem(Random().nextInt(100), image));
      allCards.add(CardItem(Random().nextInt(100), image));
    }

    allCards.shuffle();
    setState(() {
      cards = allCards;
      flippedCards = [];
      attempts = 0;
    });
  }

  void checkForMatch() {
    if (flippedCards.length == 2) {
      setState(() {
        attempts++;
        isFlipping = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        if (flippedCards[0].image == flippedCards[1].image) {
          setState(() {
            cards.removeWhere((card) => flippedCards.contains(card));
          });
        }
        flippedCards.clear();
        isFlipping = false;
      });
    }
  }

  void onCardTap(int index) {
    if (isFlipping) return;

    if (!flippedCards.contains(cards[index])) {
      setState(() {
        flippedCards.add(cards[index]);
      });

      checkForMatch();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onCardTap(index),
                  child: Card(
                    child: Center(
                      child: Text(
                        flippedCards.contains(cards[index])
                            ? cards[index].image
                            : '??',
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: initializeGame,
              child: const Text('Iniciar Juego'),
            ),
            const SizedBox(height: 10),
            Text('Intentos: $attempts'),
          ],
        ),
      ),
    );
  }
}
