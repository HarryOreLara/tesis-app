import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/models/messages/message_model.dart';
import 'package:tesis_app/presentation/blocs/chat/chat_cubit.dart';
import 'package:tesis_app/presentation/blocs/messages/message_cubit.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  final String idReceptor;
  final String nombreReceptor;

  static const String name = 'chat_screen';


  const ChatScreen(
      {super.key, required this.idReceptor, required this.nombreReceptor});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatCubit chatCubit = ChatCubit();

  @override
  void initState() {

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
          child: _BodyChat(
            colors: colors,
            idReceptor: widget.idReceptor,
          ),
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
  AuthService authService = AuthService();
  MessageCubit messageCubit = MessageCubit();
  String idEmisor = "";
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _obtenerIdEmisor();
    messageCubit.getMensajesByUser(widget.idReceptor);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _obtenerIdEmisor() async {
    final idPersonaNullable = await authService.getPersonaId();
    setState(() {
      idEmisor = idPersonaNullable ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final messageCubit = context.watch<MessageCubit>();

    return FutureBuilder(
      future: messageCubit.getMensajesByUser(widget.idReceptor),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final messageModel = snapshot.data ?? [];
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              reverse: false,
              padding: const EdgeInsets.all(20.0),
              itemCount: messageModel.length,
              itemBuilder: (context, index) {
                final MessageModel message = messageModel[index];
                final bool isMe = message.emisor == idEmisor;
                if (isMe == true) {
                  return MeChat(message: message);
                } else {
                  return YourChat(message: message);
                }
              },
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
                      controller: _textEditingController,
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
                        messageCubit.getMensajesByUser(widget.idReceptor);
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


