import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/messages/user_message_entitie.dart';

class Message extends Equatable{
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
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

