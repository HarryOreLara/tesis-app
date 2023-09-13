import 'package:tesis_app/infraestructure/models/messages/message_model.dart';

class MensajeMapper {
  static MessageModel messageDbToEntity(MessageModel messageModel) =>
      MessageModel(
          mensaje: messageModel.mensaje,
          emisor: messageModel.emisor,
          receptor: messageModel.receptor,
          leido: messageModel.leido);
}
