import 'package:tesis_app/domain/datasources/messages/message_datasource_domain.dart';

import 'package:tesis_app/domain/repositories/messages/message_repository_domain.dart';
import 'package:tesis_app/infraestructure/models/messages/message_model.dart';

class MessageRepositoryInfra extends MessageRepositoryDomain {
  final MessageDatasourceDomain messageDatasourceDomain;
  MessageRepositoryInfra(this.messageDatasourceDomain);

  @override
  Future<void> sendMessage(MessageModel messageModel) {
    return messageDatasourceDomain.sendMessage(messageModel);
  }

  @override
  Future<List<MessageModel>> getListMessagesbyId(MessageModel messageModel) {
    return messageDatasourceDomain.getListMessagesbyId(messageModel);
  }
}
