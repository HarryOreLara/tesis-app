import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/blocs/forum_v2/forum_v2_cubit.dart';

class RespuestasForumScreen extends StatelessWidget {
  final String titulo;
  final String id;
  const RespuestasForumScreen(
      {super.key, required this.id, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titulo),
          centerTitle: true,
          elevation: 3,
          leading: IconButton(
              onPressed: () {
                context.go('/forum');
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: BlocProvider(
          create: (context) => ForumV2Cubit(),
          child: BodyRespuestas(
            id: id,
            titulo: titulo,
          ),
        ));
  }
}

class BodyRespuestas extends StatefulWidget {
  final String titulo;
  final String id;
  const BodyRespuestas({super.key, required this.titulo, required this.id});

  @override
  State<BodyRespuestas> createState() => _BodyRespuestasState();
}

class _BodyRespuestasState extends State<BodyRespuestas> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ForumV2Cubit>().readAllRespuestas(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final listita = snapshot.data ?? [];

        return ListView.builder(
          itemCount: listita.length,
          itemBuilder: (context, index) {
            final listilla = listita[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(listilla.contenido),
            );
          },
        );
      },
    );
  }
}
