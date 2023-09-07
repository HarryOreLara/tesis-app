import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String name = 'chat_screen';

  const ChatScreen({super.key});

  // final String idPersonaReceptora;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.user.nombre'),
      ),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
