import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/bloc/forum/forum_bloc.dart';

class AddForumDialog extends StatefulWidget {
  final TextEditingController temaController;
  final TextEditingController descripcionController;

  const AddForumDialog(
      {super.key,
      required this.temaController,
      required this.descripcionController});

  @override
  State<AddForumDialog> createState() => _AddForumDialogState();
}

class _AddForumDialogState extends State<AddForumDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForumBloc, ForumState>(
      builder: (context, state) {
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: widget.temaController,
                    decoration:
                        const InputDecoration(labelText: 'Tema de foro'),
                  ),
                  TextField(
                    controller: widget.descripcionController,
                    inputFormatters: [LengthLimitingTextInputFormatter(35)],
                    decoration: const InputDecoration(
                        labelText: 'Descripcion del foro'),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<ForumBloc>().add(CreateForum(
                            titulo: widget.temaController.text.trim(),
                            descripcion:
                                widget.descripcionController.text.trim()));

                        context.pop(context);
                      },
                      child: const Text("Guardar nuevo foro"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
