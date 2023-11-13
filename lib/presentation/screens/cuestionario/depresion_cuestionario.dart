import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesis_app/domain/entities/cuestionario/depresion_entitie.dart';
import 'package:tesis_app/domain/entities/cuestionario/puntuacion_depresion_entitie.dart';
import 'package:tesis_app/presentation/cubits/cuestionarios/depresion/depresion_cubit.dart';

class DepresionCuestionarioScreen extends StatelessWidget {
  static const String name = 'depresion_cuestionario_screen';
  const DepresionCuestionarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuestionario Dos"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/cuestionario');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: BlocProvider(
        create: (context) => DepresionCubit(),
        child: const BodyScreen(),
      ),
    );
  }
}

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  int currectIndex = 1;
  int i = 1;
  late Future<Depresion> depresion;
  String currentDepresionId = '';
  String contenidoPregunta = '';

  Future<Depresion> readOneDepresion() async {
    final dio = Dio();
    final url = 'https://tesis-xz3b.onrender.com/assistent/getOneDepre/$i';
    final response = await dio.get(url);
    //final res = DepresionResponse.fromJson(response.data);
    final jsonData = response.data as Map<String, dynamic>;
    final depreList = jsonData["depresion"] as List<dynamic>;
    final firstDepre = depreList.first as Map<String, dynamic>;

    final pntDepresion = PuntuacionDepresion(
        si: firstDepre['puntuacion']['si'], no: firstDepre['puntuacion']['no']);

    final depresion = Depresion(
        id: firstDepre['_id'] ?? '',
        contenido: firstDepre['contenido'] ?? '',
        puntuacion: pntDepresion,
        items: (firstDepre['items'] as List<dynamic>).cast<String>(),
        numeroDocumento: firstDepre['numeroDocumento'] ?? '');

    return depresion;
  }

  // Función para manejar el botón "Si"
  void handleSiButton() async {
    // Verifica si i ha llegado a 15
    if (i < 15) {
      i++; // Incrementa i
      final nuevaDepresion = await readOneDepresion();
      setState(() {
        depresion = Future.value(nuevaDepresion);
      });
    } else {
      // Ya has llegado a la pregunta 15, puedes realizar alguna acción adicional si es necesario
    }
  }

  // Función para manejar el botón "No"
  void handleNoButton() async {
    // Verifica si i ha llegado a 15
    if (i < 15) {
      i++; // Incrementa i
      final nuevaDepresion = await readOneDepresion();
      setState(() {
        depresion = Future.value(nuevaDepresion);
      });
    } else {
      // Ya has llegado a la pregunta 15, puedes realizar alguna acción adicional si es necesario
    }
  }

  void cargarNuevaPregunta() {
    setState(() {
      depresion = readOneDepresion();
    });
  }

  @override
  void initState() {
    super.initState();
    depresion = readOneDepresion();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final depresionCubit = context.watch<DepresionCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: depresion,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return const Text("Sin conexion a internet");
                }

                if (!snapshot.hasData) {
                  return const Text("No hay datos");
                }

                final depresioncita = snapshot.data!;
                currentDepresionId = depresioncita.id;
                contenidoPregunta = depresioncita.contenido;
                return Text(
                  depresioncita.contenido,
                  style: GoogleFonts.montserrat(fontSize: 35.0),
                  textAlign: TextAlign.center,
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Ink(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  decoration: const ShapeDecoration(
                    color: Colors.blue, // Cambia el color de fondo como desees
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          10.0)), // Cambia el radio de borde según tus preferencias
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      final data = depresionCubit.sendRespuestasDepresion(
                          currentDepresionId, contenidoPregunta, true);
                      if (data == false) {
                        handleSiButton();
                        cargarNuevaPregunta();
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Seleccionaste:'),
                              content: const Text("Ya no quedan más preguntas"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.go("/cuestionario");
                                  },
                                  child: const Text('Volver al inicio'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.thumb_up, // Cambia el ícono a tu elección
                          color: Colors
                              .white, // Cambia el color del ícono como desees
                        ),
                        SizedBox(width: 8), // Espacio entre el ícono y el texto
                        Text(
                          "Si",
                          style: TextStyle(
                            color: Colors
                                .white, // Cambia el color del texto como desees
                            fontSize:
                                18, // Cambia el tamaño de fuente del texto según tus preferencias
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Ink(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  decoration: const ShapeDecoration(
                    color: Colors.red, // Cambia el color de fondo como desees
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          10.0)), // Cambia el radio de borde según tus preferencias
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      final data = depresionCubit.sendRespuestasDepresion(
                          currentDepresionId, contenidoPregunta, false);
                      if (data == false) {
                        handleNoButton();
                        cargarNuevaPregunta();
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Seleccionaste:'),
                              content: const Text("Ya no quedan más preguntas"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.go("/cuestionario");
                                  },
                                  child: const Text('Volver al inicio'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.thumb_down, // Cambia el ícono a tu elección
                          color: Colors
                              .white, // Cambia el color del ícono como desees
                        ),
                        SizedBox(width: 8), // Espacio entre el ícono y el texto
                        Text(
                          "No",
                          style: TextStyle(
                            color: Colors
                                .white, // Cambia el color del texto como desees
                            fontSize:
                                18, // Cambia el tamaño de fuente del texto según tus preferencias
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
