import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';

abstract class MessageDatasourceDomain {
  Future<void> sendMessage(Chat chat);
}
