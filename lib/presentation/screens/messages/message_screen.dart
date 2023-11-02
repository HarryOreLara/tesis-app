import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';
import 'package:tesis_app/presentation/blocs/chat/chat_cubit.dart';
import 'package:tesis_app/presentation/providers/delegates/search_person_delegate.dart';
import 'package:tesis_app/presentation/providers/message/message_provider.dart';

class MessageScreen extends ConsumerWidget {
  static const String name = 'message_screen';

  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Mensajes'),
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
                    final messageRepository =
                        ref.read(messageRepositoryProvider);
                    showSearch<Profile?>(
                            context: context,
                            delegate: SearchPersonDelegate(
                                searchPersonCallback:
                                    messageRepository.searchPerson))
                        .then((profile) {
                      if (profile == null) return;
                      GoRouter.of(context)
                          .go('/message/chat/${profile.id}/${profile.nombre}');
                    });
                  },
                  icon: const Icon(Icons.search)),
            ]),
        body: BlocProvider(
          create: (context) => ChatCubit(),
          child: const _ListChats(),
        ));
  }
}


class _ListChats extends StatelessWidget {
  const _ListChats();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ConversacionesModel>>(
      future: context.read<ChatCubit>().listChats(),
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
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: GestureDetector(
                onTap: () {
                  final idReceptor = lista[index].idReceptor;
                  final nombreReceptor = lista[index].nombreReceptor;
                  GoRouter.of(context)
                      .go('/message/chat/$idReceptor/$nombreReceptor');
                },
                child: Card(
                  elevation: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lista[index].nombreReceptor,
                          style: GoogleFonts.montserrat(
                              fontSize: 35.0, fontWeight: FontWeight.bold),
                        ),
                        const CircleAvatar(
                          radius: 35.0,
                          backgroundColor: Colors.green,
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
