import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/blocs/response_forum/response_forum_cubit.dart';

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
          create: (context) => ResponseForumCubit(),
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
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final respuestaCubit = context.watch<ResponseForumCubit>();

    return FutureBuilder(
      future: context.read<ResponseForumCubit>().readAllRespuestas(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final listita = snapshot.data ?? [];

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listita.length,
                itemBuilder: (context, index) {
                  final listilla = listita[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(listilla.contenido),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 70.0,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration.collapsed(
                          hintText: 'Escribe una respuesta'),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        respuestaCubit.sendRespuesta(
                            _textEditingController.text, widget.id);
                        _textEditingController.clear();
                      },
                      icon: const Icon(Icons.send))
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
