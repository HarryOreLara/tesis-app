import 'package:tesis_app/domain/datasources/messages/message_datasource_domain.dart';
import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';
import 'package:tesis_app/domain/repositories/messages/message_repository_domain.dart';

class MessageRepositoryInfra extends MessageRepositoryDomain {
  final MessageDatasourceDomain messageDatasourceDomain;
  MessageRepositoryInfra(this.messageDatasourceDomain);

  @override
  Future<void> sendMessage(Chat chat) {
    return messageDatasourceDomain.sendMessage(chat);
  }
}
