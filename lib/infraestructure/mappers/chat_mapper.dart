import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';

class ChatMapper {
  static Chats chatDbToEntity(Chats chats) => Chats(
      nombreReceptor: chats.nombreReceptor,
      idEmisor: chats.idEmisor,
      nombreEmisor: chats.nombreEmisor,
      idReceptor: chats.idReceptor);
}
