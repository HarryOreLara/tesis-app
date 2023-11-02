import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/infraestructure/models/messages/chat_model.dart';

abstract class ChatDatasourceDomain {
  Future<void> sendChat(ChatModel messageModel);

  Future<List<ChatModel>> getListChatsbyId(ChatModel messageModel);

  Future<List<Profile>> searchPerson(String query);
}
