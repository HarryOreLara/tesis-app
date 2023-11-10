import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesis_app/domain/entities/cuestionario/puntuacion_soledad_entitie.dart';
import 'package:tesis_app/domain/entities/cuestionario/soledad_entitie.dart';
import 'package:tesis_app/presentation/cubits/cuestionarios/soledad/soledad_cubit.dart';

class SoledadCuestionarioScreen extends StatelessWidget {
  static const String name = 'soledad_cuestionario_screen';

  const SoledadCuestionarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preguntas iniciales"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/cuestionario');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: BlocProvider(
        create: (context) => SoledadCubit(),
        child: const BodyCuestionario(),
      ),
    );
  }
}

class BodyCuestionario extends StatefulWidget {
  const BodyCuestionario({super.key});

  @override
  State<BodyCuestionario> createState() => _BodyCuestionarioState();
}

class _BodyCuestionarioState extends State<BodyCuestionario> {
  int currectIndex = 1;
  int i = 1;
  late Future<Soledad> soledad;
  String curretSoledadId = '';
  String contenidoPregunta = '';

  Future<Soledad> readOneSoledad() async {
    final dio = Dio();
    final url = 'https://tesis-xz3b.onrender.com/assistent/getOneSole/$i';
    final response = await dio.get(url);
    final jsonData = response.data as Map<String, dynamic>;
    final soleList = jsonData["soledad"] as List<dynamic>;
    final firstSole = soleList.first as Map<String, dynamic>;

    final pntSoledad = PuntuacionSoledad(
        nunca: firstSole['puntuacion']['nunca'],
        aveces: firstSole['puntuacion']['aveces'],
        conFrecuencia: firstSole['puntuacion']['conFrecuencia'],
        siempre: firstSole['puntuacion']['siempre']);

    final soledad = Soledad(
        id: firstSole['_id'] ?? '',
        contenido: firstSole['contenido'] ?? '',
        puntuacion: pntSoledad,
        items: (firstSole['items'] as List<dynamic>).cast<String>(),
        numeroDocumento: firstSole['numeroDocumento'] ?? '');
    return soledad;
  }

  void handleSiButton() async {
    // Verifica si i ha llegado a 15
    if (i < 20) {
      i++; // Incrementa i
      final nuevaSoledad = await readOneSoledad();
      setState(() {
        soledad = Future.value(nuevaSoledad);
      });
    } else {
      // Ya has llegado a la pregunta 15, puedes realizar alguna acción adicional si es necesario
    }
  }

  // Función para manejar el botón "No"
  void handleNoButton() async {
    // Verifica si i ha llegado a 15
    if (i < 20) {
      i++; // Incrementa i
      final nuevaSoledad = await readOneSoledad();
      setState(() {
        soledad = Future.value(nuevaSoledad);
      });
    } else {
      // Ya has llegado a la pregunta 15, puedes realizar alguna acción adicional si es necesario
    }
  }

  void cargarNuevaPreguntaSoledad() {
    setState(() {
      soledad = readOneSoledad();
    });
  }

  @override
  void initState() {
    super.initState();
    soledad = readOneSoledad();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final soledadCubit = context.watch<SoledadCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: soledad,
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

                final soledadcita = snapshot.data!;
                curretSoledadId = soledadcita.id;
                contenidoPregunta = soledadcita.contenido;

                return Text(
                  soledadcita.contenido,
                  style: GoogleFonts.montserrat(fontSize: 35.0),
                  textAlign: TextAlign.center,
                );
              },
            ),
            const SizedBox(
              height: 80.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          final data = soledadCubit.enviarRespuestaSoledad(
                              curretSoledadId, contenidoPregunta, "siempre");
                          if (data == false) {
                            handleSiButton();
                            cargarNuevaPreguntaSoledad();
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Seleccionaste"),
                                  content:
                                      const Text("Ya no quedan mas preguntas"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          context.go("/cuestionario");
                                        },
                                        child: const Text("Volver al inicio"))
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Siempre")),
                    ElevatedButton(
                        onPressed: () {
                          final data = soledadCubit.enviarRespuestaSoledad(
                              curretSoledadId,
                              contenidoPregunta,
                              "conFrecuencia");
                          if (data == false) {
                            handleSiButton();
                            cargarNuevaPreguntaSoledad();
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Seleccionaste"),
                                  content:
                                      const Text("Ya no quedan mas preguntas"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          context.go("/cuestionario");
                                        },
                                        child: const Text("Volver al inicio"))
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Con Frecuencia")),
                  ],
                ),
                const SizedBox(
                  height: 35.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          final data = soledadCubit.enviarRespuestaSoledad(
                              curretSoledadId, contenidoPregunta, "aveces");

                          if (data == false) {
                            handleSiButton();
                            cargarNuevaPreguntaSoledad();
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Seleccionaste"),
                                  content:
                                      const Text("Ya no quedan mas preguntas"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          context.go("/cuestionario");
                                        },
                                        child: const Text("Volver al inicio"))
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Aveces")),
                    ElevatedButton(
                        onPressed: () {
                          final data = soledadCubit.enviarRespuestaSoledad(
                              curretSoledadId, contenidoPregunta, "nunca");

                          if (data == false) {
                            handleSiButton();
                            cargarNuevaPreguntaSoledad();
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Seleccionaste"),
                                  content:
                                      const Text("Ya no quedan mas preguntas"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          context.go("/cuestionario");
                                        },
                                        child: const Text("Volver al inicio"))
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Nunca")),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
