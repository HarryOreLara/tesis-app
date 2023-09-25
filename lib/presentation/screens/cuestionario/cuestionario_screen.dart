import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CuestionarioScreen extends StatelessWidget {
  static const String name = 'cuestionario_screen';

  const CuestionarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuestionarios"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/home');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Ayudanos a conocer mas de ti",
                style: GoogleFonts.montserrat(fontSize: 30.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go('/cuestionario/soledad');
              },
              child: Card(
                child: SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 1,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.red,
                          size: 38.0,
                        ),
                        Text(
                          "Cuestionario Uno",
                          style: GoogleFonts.montserrat(fontSize: 18.0),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 38.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go('/cuestionario/depresion');
              },
              child: Card(
                child: SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 1,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.person_2_rounded,
                          color: Colors.green,
                          size: 38.0,
                        ),
                        Text(
                          "Cuestionario Dos",
                          style: GoogleFonts.montserrat(fontSize: 18.0),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 38.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
