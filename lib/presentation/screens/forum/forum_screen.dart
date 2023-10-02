import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/blocs/forum_v2/forum_v2_cubit.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class ForumScreen extends StatelessWidget {
  static const String name = 'forum_screen';
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForumV2Cubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Foro'),
          centerTitle: true,
          leading: IconButton(
              color: Colors.black,
              onPressed: () {
                context.go('/home');
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: const CuerpoForo(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return NewForumModal(); // Abre el modal de Nuevo Foro
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CuerpoForo extends StatelessWidget {
  const CuerpoForo({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ForumV2Cubit>().readAllForums(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final lista = snapshot.data ?? [];

        return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            final forum = lista[index];

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: GestureDetector(
                onTap: () {
                  // Aquí puedes manejar la navegación o acciones cuando se toca un foro
                  print("Tratando de entrar a un foro");
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 103, 113, 255),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          forum.titulo,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          forum.descripcion,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
