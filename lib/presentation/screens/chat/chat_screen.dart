import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesis_app/presentation/bloc/chat/chat_bloc.dart';
import 'package:tesis_app/presentation/widgets/message/add_contacto_dialog.dart';
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
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    context.read<ChatBloc>().add(GetAllChats(idReceptor: widget.idReceptor));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state.error != '') {
          Future.delayed(Duration.zero, () {
            context.read<ChatBloc>()
              ..add(ChatInit())
              ..add(GetAllChats(idReceptor: widget.idReceptor));
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
            context.read<ChatBloc>()
              ..add(ChatInit())
              ..add(GetAllChats(idReceptor: widget.idReceptor));
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Mensaje enviado",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
            ));
          });
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.nombreReceptor),
            centerTitle: true,
          ),
          body: state.loading
              ? const CustomCircularProgres()
              : state.listChats.isEmpty
                  // ? const NingunElementoNotification(
                  //     mensaje: "Exribe un nuevo chat")
                  ? AddContactoDialog(
                      idReceptor: widget.idReceptor,
                      nombreReceptor: widget.nombreReceptor)
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            reverse: false,
                            padding: const EdgeInsets.all(20.0),
                            itemCount: state.listChats.length,
                            itemBuilder: (context, index) {
                              final chat = state.listChats[index];
                              final bool isMe =
                                  chat.receptor == widget.idReceptor;
                              if (isMe == true) {
                                return MeChat(message: chat);
                              } else {
                                return YourChat(message: chat);
                              }
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          height: 70.0,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _textEditingController,
                                  // onChanged: messageCubit.messageChange,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: 'Escribe un mensaje'),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                              ),
                              IconButton(
                                  iconSize: 25.0,
                                  color: Colors.grey,
                                  onPressed: () {
                                    context.read<ChatBloc>().add(SendChat(
                                        idReceptor: widget.idReceptor,
                                        mensaje: _textEditingController.text
                                            .trim()));
                                    _textEditingController.clear();
                                  },
                                  icon: const Icon(
                                    Icons.send,
                                    color: Colors.purple,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
        );
      },
    );
  }
}
