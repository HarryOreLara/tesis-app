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

  factory Message.fromJson(Map<String, dynamic> json) => Message(
      sender: json["sender"] ?? '',
      time: json["time"] ?? '',
      text: json["text"] ?? '',
      leido: json["leido"] ?? '');

  Map<String, dynamic> toJson() {
    return {
      "sender":sender,
      "time":time,
      "text":text,
      "leido":leido
    };
  }
}

//Estos son los chats que se veran en pantalla principal
List<Message> chats = [
  Message(
      sender: elisaUser,
      time: '5:30 PM',
      text: 'Test de prueba 1',
      leido: true),
  Message(
      sender: luisUser,
      time: '8:10 PM',
      text: 'Teste de prueba 2',
      leido: false),
  Message(
      sender: johanUser,
      time: '10:24 PM',
      text: 'Teste de prueba 3',
      leido: true),
  Message(
      sender: arlesUser,
      time: '9:37 PM',
      text: 'Tesde de prueba 4',
      leido: false),
];

//Estos son los mensajes que estan en los chats
List<Message> messages = [
  Message(sender: arlesUser, time: '9:37 PM', text: 'Hola harry', leido: true),
  Message(
      sender: currentUser, time: '9:37 PM', text: 'Hola arles', leido: true),
  Message(sender: arlesUser, time: '9:37 PM', text: 'Hola harry', leido: true),
  Message(sender: arlesUser, time: '9:37 PM', text: 'Hola harry', leido: true),
  Message(
      sender: currentUser, time: '9:37 PM', text: 'Hola Arles', leido: true),
];
