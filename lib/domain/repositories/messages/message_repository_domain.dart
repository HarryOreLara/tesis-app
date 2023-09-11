import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';

abstract class MessageRepositoryDomain {
  Future<void> sendMessage(Chat chat);
}
