import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesis_app/presentation/bloc/profile/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = 'profile_screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
              color: Colors.white,
              onPressed: () {
                context.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          actions: const [Icon(Icons.dark_mode)],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Color.fromARGB(255, 127, 15, 219)
              ], // Colores del degradado
            ),
          ),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return const _ProfileInterface();
            },
          ),
        ));
  }
}

class _ProfileInterface extends StatefulWidget {
  const _ProfileInterface();

  @override
  State<_ProfileInterface> createState() => __ProfileInterfaceState();
}

class __ProfileInterfaceState extends State<_ProfileInterface> {
  final nombreController = TextEditingController();
  final apellidosController = TextEditingController();
  final edadController = TextEditingController();
  final generoController = TextEditingController();
  final dniController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          radius: 100,
                          foregroundImage:
                              AssetImage('assets/images/perfil.webp'),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: const Icon(
                              Icons.photo,
                              color: Color.fromARGB(255, 0, 0, 0),
                              size: 25.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Hola como estas?',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: nombreController,
                  decoration: InputDecoration(
                      hintText: "Ingrese su nombre",
                      filled: true, // Indica que el fondo debe ser llenado
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: apellidosController,
                  decoration: InputDecoration(
                      hintText: "Ingrese sus apellidos",
                      filled: true, // Indica que el fondo debe ser llenado
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: edadController,
                  decoration: InputDecoration(
                      hintText: "Ingrese su edad",
                      filled: true, // Indica que el fondo debe ser llenado
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: generoController,
                  decoration: InputDecoration(
                      hintText: "Ingrese su genero",
                      filled: true, // Indica que el fondo debe ser llenado
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: dniController,
                  decoration: InputDecoration(
                      hintText: "Ingrese su DNI",
                      filled: true, // Indica que el fondo debe ser llenado
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    context.read<ProfileBloc>().add(SaveProfile(
                          nombre: nombreController.text.trim(),
                          apellidos: apellidosController.text.trim(),
                          edad: edadController.text.trim(),
                          genero: generoController.text.trim(),
                          dni: dniController.text.trim(),
                        ));
                  },
                  child: const Text(
                    'Guardar Datos',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SizedBox(
            width: 100,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                context.read<ProfileBloc>().add(CerrarSesion());
                context.push('/');
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ), // Ícono del botón
              label: const Text(
                'Cerrar Sesión',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ), // Etiqueta del botón
            ),
          ),
        ),
      ],
    );
  }
}
