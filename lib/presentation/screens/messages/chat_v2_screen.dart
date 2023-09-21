import 'package:flutter/material.dart';
import 'package:tesis_app/presentation/blocs/chat/chat_cubit.dart';

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
    return Container(
      child: Center(
        child:
            Container(child: Text(widget.idReceptor + widget.nombreReceptor)),
      ),
    );
  }
}
