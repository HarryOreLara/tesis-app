import 'package:tesis_app/infraestructure/models/messages/chat_model.dart';

class ChatMapper {
  static ChatModel messageDbToEntity(ChatModel messageModel) => ChatModel(
      id: messageModel.id,
      mensaje: messageModel.mensaje,
      leido: messageModel.leido,
      tiempo: messageModel.tiempo,
      emisor: messageModel.emisor,
      receptor: messageModel.receptor);
}
