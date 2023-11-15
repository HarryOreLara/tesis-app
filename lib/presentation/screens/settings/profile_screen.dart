import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesis_app/presentation/bloc/profile/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  static const String name = 'profile_screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final apellidosController = TextEditingController();
  final edadController = TextEditingController();
  final generoController = TextEditingController();
  final dniController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    apellidosController.dispose();
    edadController.dispose();
    generoController.dispose();
    dniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.error != '') {
          Future.delayed(Duration.zero, () {
            context.read<ProfileBloc>().add(ProfileInit());
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.error,
                style: const TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.red,
            ));
          });
        }

        if (state.add) {
          Future.delayed(Duration.zero, () {
            context.read<ProfileBloc>().add(ProfileInit());
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Perfil Registrado",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
            ));
          });
        }
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text(
                "Mi Perfil",
                style: TextStyle(
                    fontFamily: 'Gotham-Book',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              centerTitle: true,
              leading: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    context.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
            ),
            body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue,
                      Color.fromARGB(255, 230, 199, 255)
                    ], // Colores del degradado
                  ),
                ),
                child: ListView(
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
                                      foregroundImage: AssetImage(
                                          'assets/images/perfil.webp'),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
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
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nombreController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es obligatorio';
                                }
                                if (value.length > 20) {
                                  return 'Su nombre es muy grande';
                                }

                                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                  return 'Su nombre contiene un numero, eliminelo';
                                }
                                return null; // La validación pasó
                              },
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                  hintText: "Ingrese su nombre",
                                  filled:
                                      true, // Indica que el fondo debe ser llenado
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              controller: apellidosController,
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                  hintText: "Ingrese sus apellidos",
                                  filled:
                                      true, // Indica que el fondo debe ser llenado
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es obligatorio';
                                }
                                if (value.length > 20) {
                                  return 'Su apellido es muy grande';
                                }

                                if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                                  return 'Su apellido contiene un número o caracteres no permitidos';
                                }
                                return null; // La validación pasó
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              controller: edadController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es obligatorio';
                                }
                                if (value.length != 2 ||
                                    !RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return 'Ingrese una edad válida';
                                }

                                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return 'Ingrese solo números';
                                }
                                
                                return null; // La validación pasó
                              },
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                  hintText: "Ingrese su edad",
                                  filled:
                                      true, // Indica que el fondo debe ser llenado
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              controller: generoController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es obligatorio';
                                }
                                if (value.length > 9 || value.length < 8) {
                                  return 'Error al escribir el genero';
                                }

                                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                  return 'El genero contiene un numero, eliminelo';
                                }
                                return null; // La validación pasó
                              },
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                  hintText: "Ingrese su genero",
                                  filled:
                                      true, // Indica que el fondo debe ser llenado
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              controller: dniController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo es obligatorio';
                                }
                                if (value.length != 8) {
                                  return 'El dni no tiene el tamaño correcto';
                                }
                                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return 'Ingrese solo números';
                                }
                                return null; // La validación pasó
                              },
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                  hintText: "Ingrese su DNI",
                                  filled:
                                      true, // Indica que el fondo debe ser llenado
                                  fillColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<ProfileBloc>().add(SaveProfile(
                                        nombre: nombreController.text.trim(),
                                        apellidos:
                                            apellidosController.text.trim(),
                                        edad: edadController.text.trim(),
                                        genero: generoController.text.trim(),
                                        dni: dniController.text.trim(),
                                      ));
                                  Future.delayed(
                                    const Duration(seconds: 5),
                                    () {
                                      context.pop(context);
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                'Guardar Datos',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22.0),
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
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ), // Etiqueta del botón
                        ),
                      ),
                    ),
                  ],
                )));
      },
    );
  }
}
