import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/bloc/forum/forum_bloc.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class RespuestasForumScreen extends StatefulWidget {
  final String titulo;
  final String id;
  const RespuestasForumScreen(
      {super.key, required this.id, required this.titulo});

  @override
  State<RespuestasForumScreen> createState() => _RespuestasForumScreenState();
}

class _RespuestasForumScreenState extends State<RespuestasForumScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    context.read<ForumBloc>().add(GetAllRespuestasByForum(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForumBloc, ForumState>(
      builder: (context, state) {
        if (state.error != '') {
          Future.delayed(Duration.zero, () {
            context.read<ForumBloc>()
              ..add(ForumInit())
              ..add(GetAllRespuestasByForum(id: widget.id));
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
            context.read<ForumBloc>()
              ..add(ForumInit())
              ..add(GetAllRespuestasByForum(id: widget.id));
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Respuesta enviada",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
            ));
          });
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.titulo),
            centerTitle: true,
            elevation: 3,
            leading: IconButton(
                onPressed: () {
                  context.go('/forum');
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          body: state.loading
              ? const CustomCircularProgres()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.listRespuestaForo.length,
                        itemBuilder: (context, index) {
                          final respuesta = state.listRespuestaForo[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: Text(respuesta.contenido),
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
                                context.read<ForumBloc>().add(SendRespuesta(
                                    respuesta:
                                        _textEditingController.text.trim(),
                                    id: widget.id));
                                _textEditingController.clear();
                              },
                              icon: const Icon(Icons.send))
                        ],
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
