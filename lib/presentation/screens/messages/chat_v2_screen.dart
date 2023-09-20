import 'package:flutter/material.dart';

class ChatScreenV2 extends StatefulWidget {
  final String idReceptor;

  const ChatScreenV2({super.key, required this.idReceptor});

  @override
  State<ChatScreenV2> createState() => _ChatScreenV2State();
}

class _ChatScreenV2State extends State<ChatScreenV2> {

  @override
  void initState() {
    //Peticion de chats
    //Peticion de Receptor para msotrar el mostrar elo nombre
    //Guardar chat
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

