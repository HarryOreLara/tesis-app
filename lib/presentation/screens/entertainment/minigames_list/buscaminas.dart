import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/config/theme/buscaminas_color.dart';
import 'package:tesis_app/core/utils/buscaminas.dart';

class BuscaminasScreen extends StatefulWidget {
  const BuscaminasScreen({super.key});

  @override
  State<BuscaminasScreen> createState() => _BuscaminasScreenState();
}

class _BuscaminasScreenState extends State<BuscaminasScreen> {
  Buscaminas buscaminas = Buscaminas();

  @override
  void initState() {
    super.initState();
    buscaminas.generateMap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BuscaminasColor.primaryColor,
      appBar: AppBar(
        title: const Text(
          "Buscaminas",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
        leading: IconButton(
            onPressed: () {
              context.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: BuscaminasColor.primaryColor,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 16.0),
                  decoration: BoxDecoration(
                      color: BuscaminasColor.lightPrimaryColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.flag,
                        color: Color(0xFF7a9eb8),
                        size: 34.0,
                      ),
                      Text(
                        "10",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 16.0),
                  decoration: BoxDecoration(
                      color: BuscaminasColor.lightPrimaryColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.timer,
                        color: Color(0xFF7a9eb8),
                        size: 34.0,
                      ),
                      Text(
                        "10:32",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 500.0,
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Buscaminas.row,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemCount: Buscaminas.cells,
              itemBuilder: (context, index) {
                Color cellColor = buscaminas.gameMap[index].reveal
                    ? BuscaminasColor.clickedCard
                    : BuscaminasColor.lightPrimaryColor;
                return GestureDetector(
                  onTap: buscaminas.gameOver
                      ? null
                      : () {
                          setState(() {
                            buscaminas
                                .getClickedCell(buscaminas.gameMap[index]);
                          });
                        },
                  child: Container(
                    decoration: BoxDecoration(
                        color: cellColor,
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Center(
                      child: Text(
                        buscaminas.gameMap[index].reveal
                            ? "${buscaminas.gameMap[index].content}"
                            : "",
                        style: TextStyle(
                            color: buscaminas.gameMap[index].reveal
                                ? buscaminas.gameMap[index].content == "X"
                                    ? Colors.red
                                    : BuscaminasColor.letterColors[
                                        buscaminas.gameMap[index].content]
                                : Colors.transparent,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Text(
            buscaminas.gameOver ? "Perdiste" : "",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          RawMaterialButton(
            onPressed: () {
              setState(() {
                buscaminas.resetGame();
                buscaminas.gameOver = false;
              });
            },
            fillColor: BuscaminasColor.lightPrimaryColor,
            elevation: 0,
            shape: const StadiumBorder(),
            padding:
                const EdgeInsets.symmetric(horizontal: 64.0, vertical: 20.0),
            child: const Text(
              "Volver a intentar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
