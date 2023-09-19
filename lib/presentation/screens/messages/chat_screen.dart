import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'package:tesis_app/domain/entities/messages/user_message_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/models/messages/message_model.dart';
import 'package:tesis_app/presentation/blocs/messages/message_cubit.dart';

class ChatScreen extends StatelessWidget {
  static const String name = 'chat_screen';
  final User object;

  const ChatScreen({super.key, required this.object});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        backgroundColor: const Color(0xfff6f6f6),
        appBar: AppBar(
          leading: IconButton(
              color: Colors.white,
              onPressed: () {
                GoRouter.of(context).go('/message');
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: object.nombre,
                    style: const TextStyle(
                        fontSize: 22.0, fontWeight: FontWeight.w400)),
                const TextSpan(text: '\n'),
                object.isOnline
                    ? const TextSpan(
                        text: 'En linea',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w400))
                    : const TextSpan(
                        text: 'Desconectado',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w400))
              ])),
          centerTitle: true,
          elevation: 8,
          backgroundColor: Colors.blue,
        ),
        body: BlocProvider(
          create: (context) => MessageCubit(),
          child: _BodyChat(colors: colors, object: object),
        ));
  }
}

class _BodyChat extends StatefulWidget {
  const _BodyChat({
    required this.colors,
    required this.object,
  });

  final ColorScheme colors;
  final User object;

  @override
  State<_BodyChat> createState() => _BodyChatState();
}

class _BodyChatState extends State<_BodyChat> {
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
    // final messagesModel = messageCubit.getMensajesByUser();

    return FutureBuilder(
        future: messageCubit.getMensajesByUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // Maneja errores si ocurren durante la obtención de mensajes.
            return Text('Error: ${snapshot.error}');
          } else {
            final messagesModel = snapshot.data ?? [];
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(20.0),
                  itemCount: messagesModel.length,
                  itemBuilder: (context, index) {
                    final MessageModel message = messagesModel[index];
                    final authService = AuthService();
                    final idPersonaNullable = authService.getUserId();
                    final idEmisor = idPersonaNullable;
                    final bool isMe = message.emisor == idEmisor.toString();
                    if (isMe == true) {
                      return _MeChat(
                        message: message,
                      );
                    } else {
                      return _YourChat(
                        message: message,
                      );
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
                            messageCubit.sendMessage(widget.object.id);
                            print(widget.object.id);
                            messageCubit.getMensajesByUser();
                          },
                          icon: const Icon(Icons.send))
                    ],
                  ),
                )
              ],
            );
          }
        });
  }
}

class _MeChat extends StatefulWidget {
  final MessageModel message;

  const _MeChat({super.key, required this.message});

  @override
  State<_MeChat> createState() => __MeChatState();
}

class __MeChatState extends State<_MeChat> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: Container(
            constraints: BoxConstraints(maxWidth: size.width * 0.80),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5)
                ]),
            child: Text(
              widget.message.mensaje,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "15:00",
              style: TextStyle(fontSize: 12.00, color: Colors.black45),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
              child: const CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    'https://img.allvipp.com/www-promipool-de/image/upload/w_580,f_webp,q_auto:eco/Liam_Neeson_His_Best_Roles_200604_gfgbns85i1'),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _YourChat extends StatefulWidget {
  final MessageModel message;

  const _YourChat({super.key, required this.message});

  @override
  State<_YourChat> createState() => __YourChatState();
}

class __YourChatState extends State<_YourChat> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Container(
            constraints: BoxConstraints(maxWidth: size.width * 0.80),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5)
                ]),
            child: Text(
              widget.message.mensaje,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
              child: const CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    'https://img.allvipp.com/www-promipool-de/image/upload/w_580,f_webp,q_auto:eco/Liam_Neeson_His_Best_Roles_200604_gfgbns85i1'),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Text(
              "16:00",
              style: TextStyle(fontSize: 12.00, color: Colors.black45),
            ),
          ],
        )
      ],
    );
  }
}

//TODO_ PRUEBAS DE SOCKETS
class _Probando extends StatefulWidget {
  const _Probando({super.key});

  @override
  State<_Probando> createState() => __ProbandoState();
}

class __ProbandoState extends State<_Probando> {
  final socket =
      io.io("https://tesis-xz3b.onrender.com/sendMessage/sendMessage/fdsfdf");

  @override
  void initState() {
    super.initState();
    socket.on('newMessage', (data) => {print('Mensaje recibido: $data')});
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat en tiempo real'),
      ),
      // Construye la interfaz de usuario de tu aplicación aquí
    );
  }
}
