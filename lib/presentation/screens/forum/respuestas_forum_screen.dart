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
            child: Center(
              child: Text(id),
            )));
  }
}
