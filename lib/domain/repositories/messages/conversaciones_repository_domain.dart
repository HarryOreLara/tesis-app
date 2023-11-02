import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';

abstract class ConversacionesRepositoryDomain {
  Future<void> saveConversaciones(ConversacionesModel chats);
  Future<List<ConversacionesModel>> allConversaciones(String idEmisor);
  Future<ConversacionesModel> oneConversacion(String idReceptor, String idEmisor);

}
