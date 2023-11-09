import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';

class ConversacionesMapper {
  static ConversacionesModel chatDbToEntity(ConversacionesModel chats) =>
      ConversacionesModel(
          id: chats.id,
          nombreReceptor: chats.nombreReceptor,
          idEmisor: chats.idEmisor,
          nombreEmisor: chats.nombreEmisor,
          idReceptor: chats.idReceptor,
          createdAt: chats.createdAt);
}
