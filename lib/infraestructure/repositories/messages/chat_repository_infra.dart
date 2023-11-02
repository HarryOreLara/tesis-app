import 'package:tesis_app/domain/datasources/messages/chat_datasource_domain.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/domain/repositories/messages/chat_repository_domain.dart';
import 'package:tesis_app/infraestructure/models/messages/chat_model.dart';

class ChatRepositoryInfra extends MessageRepositoryDomain {
  final ChatDatasourceDomain chatDatasourceDomain;
  ChatRepositoryInfra(this.chatDatasourceDomain);

  @override
  Future<List<Profile>> searchPerson(String query) {
    return chatDatasourceDomain.searchPerson(query);
  }

  @override
  Future<List<ChatModel>> getListChatsbyId(ChatModel messageModel) {
    return chatDatasourceDomain.getListChatsbyId(messageModel);
  }

  @override
  Future<void> sendChat(ChatModel messageModel) {
    return chatDatasourceDomain.sendChat(messageModel);
  }
}
