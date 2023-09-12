
import 'package:tesis_app/domain/entities/messages/message_entitie.dart';

abstract class MessageRepositoryDomain {
  Future<void> sendMessage(Message message);
}
