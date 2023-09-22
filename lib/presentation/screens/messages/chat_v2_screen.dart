import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/blocs/chat/chat_cubit.dart';
import 'package:tesis_app/presentation/blocs/messages/message_cubit.dart';

class ChatScreenV2 extends StatefulWidget {
  final String idReceptor;
  final String nombreReceptor;

  const ChatScreenV2(
      {super.key, required this.idReceptor, required this.nombreReceptor});

  @override
  State<ChatScreenV2> createState() => _ChatScreenV2State();
}

class _ChatScreenV2State extends State<ChatScreenV2> {
  ChatCubit chatCubit = ChatCubit();

  @override
  void initState() {
    //Peticion de chats
    //Peticion de Receptor para msotrar el mostrar elo nombre
    //Guardar chat
    super.initState();
    chatCubit.saveChat(widget.idReceptor, widget.nombreReceptor);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.nombreReceptor),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).go('/message');
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: BlocProvider(
          create: (context) => MessageCubit(),
          child: _BodyChat(colors: colors, idReceptor: widget.idReceptor,),
        ));
  }
}

class _BodyChat extends StatefulWidget {
  final ColorScheme colors;
  final String idReceptor;
  const _BodyChat({required this.colors, required this.idReceptor});

  @override
  State<_BodyChat> createState() => __BodyChatState();
}

class __BodyChatState extends State<_BodyChat> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageCubit = context.watch<MessageCubit>();

    return FutureBuilder(
      future: messageCubit.getMensajesByUser(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final messageModel = snapshot.data ?? [];
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(20.0),
              itemCount: messageModel.length,
              itemBuilder: (context, index) {},
            )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 70.0,
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                      iconSize: 25.0,
                      color: widget.colors.primary,
                      onPressed: () {},
                      icon: const Icon(Icons.photo)),
                  Expanded(
                    child: TextField(
                      onChanged: messageCubit.messageChange,
                      decoration: const InputDecoration.collapsed(
                          hintText: 'Escribe un mensaje'),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  IconButton(
                      iconSize: 25.0,
                      color: widget.colors.primary,
                      onPressed: () {
                        messageCubit.sendMessage(widget.idReceptor);
                        messageCubit.getMensajesByUser();
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
