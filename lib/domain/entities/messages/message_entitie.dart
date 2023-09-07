import 'package:tesis_app/domain/entities/messages/user_message_entitie.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool leido;

  Message(
      {required this.sender,
      required this.time,
      required this.text,
      required this.leido});
}

//Estos son los chats que se veran en pantalla principal
List<Message> chats = [
  Message(sender: elisaUser, time: '5:30 PM', text: 'Hola', leido: true),
  Message(sender: luisUser, time: '8:10 PM', text: 'Hola v2', leido: false),
  Message(sender: johanUser, time: '10:24 PM', text: 'Hola v3', leido: true),
  Message(
      sender: arlesUser,
      time: '9:37 PM',
      text: 'Me revientas el poto?',
      leido: false),
];

//Estos son los mensajes que estan en los chats
List<Message> messages = [
  Message(sender: arlesUser, time: '9:37 PM', text: 'Hola harry', leido: false),
  Message(
      sender: currentUser, time: '9:37 PM', text: 'Hola arles', leido: false),
  Message(sender: arlesUser, time: '9:37 PM', text: 'Hola harry', leido: false),
  Message(sender: arlesUser, time: '9:37 PM', text: 'Hola harry', leido: false),
  Message(
      sender: currentUser, time: '9:37 PM', text: 'Hola Arles', leido: false),
];
