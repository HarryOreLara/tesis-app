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
    return {"sender": sender, "time": time, "text": text, "leido": leido};
  }
}

User user = User(id: "id", nombre: "harry", imgUrl: "", isOnline: true);
User user2 = User(id: "id", nombre: "Stinger", imgUrl: "", isOnline: true);


// //Estos son los chats que se veran en pantalla principal
List<Message> chats = [
  Message(sender: user, time: "time", text: "HOla que tal", leido: true),
  Message(sender: user2, time: "time", text: "HOla que tal", leido: true)

];

// //Estos son los mensajes que estan en los chats
