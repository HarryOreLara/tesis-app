
import 'package:tesis_app/domain/entities/messages/message_entitie.dart';

abstract class MessageDatasourceDomain {
  Future<void> sendMessage(Message message);
}
