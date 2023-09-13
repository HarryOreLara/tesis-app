import 'package:tesis_app/infraestructure/models/messages/message_model.dart';

abstract class MessageRepositoryDomain {
  Future<void> sendMessage(MessageModel messageModel);

  Future<List<MessageModel>> getListMessagesbyId(MessageModel messageModel);
}
