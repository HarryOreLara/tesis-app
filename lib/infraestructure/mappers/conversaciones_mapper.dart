import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';

class ConversacionesMapper {
  static ConversacionesModel chatDbToEntity(ConversacionesModel chats) =>
      ConversacionesModel(
          nombreReceptor: chats.nombreReceptor,
          idEmisor: chats.idEmisor,
          nombreEmisor: chats.nombreEmisor,
          idReceptor: chats.idReceptor);
}
