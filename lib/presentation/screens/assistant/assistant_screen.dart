import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AssistantScreen extends StatelessWidget {
  static const String name = 'assistant_screen';

  const AssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            flexibleSpace: const _CustomAppbar(),
            centerTitle: true,
          ),
        ),
        body: const _CardAsistenteLogo());
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 14, 199, 255),
            Color.fromARGB(255, 0, 130, 255),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}

class _CardAsistenteLogo extends StatelessWidget {
  const _CardAsistenteLogo();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        FadeInDownBig(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)),
            child: SizedBox(
              width: size.width * 1,
              height: size.height * 0.2,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 7, 197, 255),
                  Color.fromARGB(255, 0, 109, 255),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/medicines.jpg'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        child: Text(
                      'Hola soy yu asistente virtual',
                      style: TextStyle(fontSize: 20),
                    ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
