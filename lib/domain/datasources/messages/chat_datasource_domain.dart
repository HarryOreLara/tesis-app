import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';

abstract class ChatDatasourceDomain {
  Future<void> saveChat(Chats chats);
  Future<List<Chats>> allChats(String idEmisor);
  Future<Chats> oneChat(String idReceptor, String idEmisor);
}
