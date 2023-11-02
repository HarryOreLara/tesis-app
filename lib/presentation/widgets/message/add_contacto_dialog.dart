import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/bloc/conversaciones/conversaciones_bloc.dart';

class AddContactoDialog extends StatefulWidget {
  final String idReceptor;
  final String nombreReceptor;

  const AddContactoDialog(
      {super.key, required this.idReceptor, required this.nombreReceptor});

  @override
  State<AddContactoDialog> createState() => _AddContactoDialogState();
}

class _AddContactoDialogState extends State<AddContactoDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversacionesBloc, ConversacionesState>(
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
                  ElevatedButton(
                      onPressed: () {
                        context.pop(context);
                      },
                      child: const Text(
                        "Volver",
                        style: TextStyle(color: Colors.red),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        context.read<ConversacionesBloc>().add(
                            SaveConversaciones(
                                idReceptor: widget.idReceptor,
                                nombreReceptor: widget.nombreReceptor));

                        context.pop(context);
                      },
                      child: const Text("Agregar contacto"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
