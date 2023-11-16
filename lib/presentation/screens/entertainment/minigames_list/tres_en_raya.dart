import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/config/theme/raya_color.dart';
import 'package:tesis_app/core/utils/game_logic.dart';

class TresEnRayaScreen extends StatefulWidget {
  const TresEnRayaScreen({super.key});

  @override
  State<TresEnRayaScreen> createState() => _TresEnRayaScreenState();
}

class _TresEnRayaScreenState extends State<TresEnRayaScreen> {
  //Variables necesarias
  String lastValue = "X";
  Game game = Game();
  int turn = 0;
  String result = "";
  List<int> scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0];

  //Inizializando
  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    bool gameOver = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tres en Raya",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham-Medium',
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: RayaColor.primaryColor,
      ),
      backgroundColor: RayaColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Turno: $lastValue".toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 58),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
              crossAxisCount: Game.boardLenght ~/ 3,
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(Game.boardLenght, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          if (game.board![index] == "") {
                            setState(() {
                              game.board![index] = lastValue;
                              turn++;
                              gameOver = game.winnerChek(
                                  lastValue, index, scoreBoard, 3);

                              if (gameOver) {
                                result = "$lastValue Es el ganador";
                              } else if (!gameOver && turn == 9) {
                                result = "Empate";
                                gameOver = true;
                              }
                              if (lastValue == "X") {
                                lastValue = "O";
                              } else {
                                lastValue = "X";
                              }
                            });
                          }
                        },
                  child: Container(
                    width: Game.blocSize,
                    height: Game.blocSize,
                    decoration: BoxDecoration(
                        color: RayaColor.secondColor,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Center(
                      child: Text(
                        game.board![index],
                        style: TextStyle(
                            color: game.board![index] == "X"
                                ? Colors.blue
                                : Colors.pink,
                            fontSize: 64.0),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Text(
            result,
            style: const TextStyle(color: Colors.white, fontSize: 54.0),
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                game.board = Game.initGameBoard();
                lastValue = "X";
                gameOver = false;
                turn = 0;
                result = "";
                scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0];
              });
            },
            icon: const Icon(Icons.replay),
            label: const Text("Repetir el juego"),
          )
        ],
      ),
    );
  }
}
