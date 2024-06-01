import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesis_app/domain/entities/home/home_entitite.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF008FD5), Color(0xff003976)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        // child: const _PrincipalInterface(),
        child: const HomeInterface(),
      ),
    );
  }
}

class HomeInterface extends StatefulWidget {
  const HomeInterface({super.key});

  @override
  State<HomeInterface> createState() => _HomeInterfaceState();
}

class _HomeInterfaceState extends State<HomeInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.purple.shade500
            ], // Colores del degradado
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bienvenido",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 167, 167, 167),
                                fontSize: 25,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  IconButton(
                      alignment: Alignment.topCenter,
                      onPressed: () {
                        context.push('/profile');
                      },
                      icon: const CircleAvatar(
                        
                        backgroundImage:
                            AssetImage('assets/images/perfil.png'),
                        radius: 40,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            _GridDashboard()
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _GridDashboard extends StatelessWidget {
  Home home1 = Home(
      title: 'Mensajes',
      subtitle: 'Interactua con las personas',
      event: '/conversacion',
      img: 'assets/images/message.png');
  Home home2 = Home(
      title: 'Medicamentos',
      subtitle: 'Programa tus tiempos adecuados',
      event: '/medicines',
      img: 'assets/images/medicines.png');
  Home home3 = Home(
      title: 'Entrentemiento',
      subtitle: 'Diviertete con multiples opciones',
      event: '/entertainment',
      img: 'assets/images/entertainment.png');
  Home home4 = Home(
      title: 'Foro',
      subtitle: 'Interactua en grupos de discucion',
      event: '/forum',
      img: 'assets/images/forum.png');
  Home home5 = Home(
      title: 'Asistente',
      subtitle: 'Un asistente que te ayudara en tu dia a dia',
      event: '/assistant',
      img: 'assets/images/assistant.png');
  Home home6 = Home(
      title: 'Cuestionarios',
      subtitle: 'Preguntas que nos ayudara a conocerte',
      event: '/cuestionario',
      img: 'assets/images/cuestionario.png');

  @override
  Widget build(BuildContext context) {
    List<Home> myList = [home1, home2, home3, home4, home5, home6];

    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
              onTap: () {
                context.push(data.event);
              },
              child: Container(
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(0, 126, 126, 126).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      data.img,
                      width: 42.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        data.subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Colors.white38,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}
