import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/infraestructure/models/messages/message_model.dart';

abstract class MessageDatasourceDomain {
  Future<void> sendMessage(MessageModel messageModel);

  Future<List<MessageModel>> getListMessagesbyId(MessageModel messageModel);

  Future<List<Profile>> searchPerson(String query);
}
