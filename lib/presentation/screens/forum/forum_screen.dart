import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/bloc/forum/forum_bloc.dart';
import 'package:tesis_app/presentation/widgets/forum/add_forum_dialog.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class ForumScreen extends StatefulWidget {
  static const String name = 'forum_screen';
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final TextEditingController temaController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  @override
  void initState() {
    context.read<ForumBloc>().add(GetAllForums());
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
              ..add(GetAllForums());
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
              ..add(GetAllForums());
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Foro registrado",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
            ));
          });
        }

        return Scaffold(
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
          body: state.loading
              ? const CustomCircularProgres()
              : state.listForum.isEmpty
                  ? const NingunElementoNotification(
                      mensaje: "No existen foros")
                  : ListView.builder(
                      itemCount: state.listForum.length,
                      itemBuilder: (context, index) {
                        final forum = state.listForum[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              context.go(
                                  '/respuestas/${forum.id}/${forum.titulo}');
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 103, 113, 255),
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
                    ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddForumDialog(
                    temaController: temaController,
                    descripcionController: descripcionController),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
