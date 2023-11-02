import 'package:flutter/material.dart';
import 'package:tesis_app/infraestructure/models/messages/chat_model.dart';

class YourChat extends StatefulWidget {
  final ChatModel message;

  const YourChat({super.key, required this.message});

  @override
  State<YourChat> createState() => _YourChatState();
}

class _YourChatState extends State<YourChat> {
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
                backgroundColor: Colors.white,
                radius: 15,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
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
