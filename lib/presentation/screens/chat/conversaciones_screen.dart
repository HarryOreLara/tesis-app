import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/presentation/bloc/conversaciones/conversaciones_bloc.dart';
import 'package:tesis_app/presentation/providers/delegates/search_person_delegate.dart';
import 'package:tesis_app/presentation/providers/message/message_provider.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class ConversacionesScreen extends ConsumerWidget {
  static const String name = 'conversaciones_screen';

  const ConversacionesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Conversaciones'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).go('/home');
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  final messageRepository = ref.read(messageRepositoryProvider);
                  showSearch<Profile?>(
                          context: context,
                          delegate: SearchPersonDelegate(
                              searchPersonCallback:
                                  messageRepository.searchPerson))
                      .then((profile) {
                    if (profile == null) return;

                    context.push('/chat/${profile.id}/${profile.nombre}');
                  });
                },
                icon: const Icon(Icons.search)),
          ]),
      body: const ListConversaciones(),
    );
  }
}

class ListConversaciones extends StatefulWidget {
  const ListConversaciones({super.key});

  @override
  State<ListConversaciones> createState() => _ListConversacionesState();
}

class _ListConversacionesState extends State<ListConversaciones> {
  @override
  void initState() {
    context.read<ConversacionesBloc>().add(GetAllConversaciones());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversacionesBloc, ConversacionesState>(
      builder: (context, state) {
        if (state.error != '') {
          Future.delayed(Duration.zero, () {
            context.read<ConversacionesBloc>()
              ..add(ConversacionesInit())
              ..add(GetAllConversaciones());
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
            context.read<ConversacionesBloc>()
              ..add(ConversacionesInit())
              ..add(GetAllConversaciones());
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Conversacion agregada",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
            ));
          });
        }

        return state.loading
            ? const CustomCircularProgres()
            : state.listConversaciones.isEmpty
                ? const NingunElementoNotification(
                    mensaje: "No hay conversaciones",
                  )
                : ListView.builder(
                    itemCount: state.listConversaciones.length,
                    itemBuilder: (context, index) {
                      final conversacion = state.listConversaciones[index];
                      return FadeIn(
                        child: GestureDetector(
                          onTap: () {
                            context.push(
                                '/chat/${conversacion.idReceptor}/${conversacion.nombreReceptor}');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 20,
                                    offset: const Offset(1, 1),
                                    color: const Color(0xFF333333)
                                        .withOpacity(0.2))
                              ]),
                              height: 100.0,
                              child: Card(
                                color: const Color(0xFF333333),
                                elevation: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30.0,
                                        child: Icon(
                                          Icons.person,
                                          size: 30.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(conversacion.nombreReceptor,
                                              style: const TextStyle(
                                                  fontSize: 25.0,
                                                  fontFamily: 'Gotham-Book',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                            conversacion.nombreEmisor,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                fontFamily: 'Gotham-Light'),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
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
