import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/blocs/forum_v2/forum_v2_cubit.dart';

class NewForumModal extends StatelessWidget {
  const NewForumModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ForumV2Cubit(),
        child: Alerta(),
      ),
    );
  }
}

class Alerta extends StatelessWidget {
  Alerta({super.key});
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final forumCubit = context.watch<ForumV2Cubit>();
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text('Nuevo Foro'),
      content: BlocProvider(
        create: (context) => ForumV2Cubit(),
        child: SizedBox(
          height: size.height * 0.2,
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Tema del Foro'),
              ),
              TextField(
                controller: _descriptionController,
                decoration:
                    const InputDecoration(labelText: 'Descripcion del foro'),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Cierra el modal
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () async {
            final validar = await forumCubit.createForum(
                _titleController.text, _descriptionController.text);
            if (validar) {
              context.go('/forum');
            }
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
