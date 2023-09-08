import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RompecabezasMinigameScreen extends StatelessWidget {
  const RompecabezasMinigameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rompecabezas'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/minigames');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: const PuzzleScreen(),
    );
  }
}

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  PuzzleScreenState createState() => PuzzleScreenState();
}

class PuzzleScreenState extends State<PuzzleScreen> {
  List<int> tiles = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  int emptyTileIndex = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: tiles.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _moveTile(index);
            },
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  tiles[index] != 8 ? tiles[index].toString() : '',
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _moveTile(int index) {
    if (_isValidMove(index)) {
      setState(() {
        tiles[emptyTileIndex] = tiles[index];
        tiles[index] = 8;
        emptyTileIndex = index;
      });
    }
  }

  bool _isValidMove(int index) {
    return (index == emptyTileIndex - 1 ||
        index == emptyTileIndex + 1 ||
        index == emptyTileIndex - 3 ||
        index == emptyTileIndex + 3);
  }
}
