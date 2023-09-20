import 'package:tesis_app/domain/datasources/messages/chat_datasource_domain.dart';
import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';
import 'package:tesis_app/domain/repositories/messages/chat_repository_domain.dart';

class ChatRepositoryInfra extends ChatRepositoryDomain {
  final ChatDatasourceDomain chatDatasourceDomain;

  ChatRepositoryInfra(this.chatDatasourceDomain);

  @override
  Future<void> saveChat(Chats chats) {
    return chatDatasourceDomain.saveChat(chats);
  }

  @override
  Future<List<Chats>> allChats(String idEmisor) {
    return chatDatasourceDomain.allChats(idEmisor);
  }

  @override
  Future<Chats> oneChat(String idReceptor, String idEmisor) {
    return chatDatasourceDomain.oneChat(idReceptor, idEmisor);
  }
}
