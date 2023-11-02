import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';

abstract class ConversacionesDatasourceDomain {
  Future<void> saveChat(ConversacionesModel chats);
  Future<List<ConversacionesModel>> allChats(String idEmisor);
  Future<ConversacionesModel> oneChat(String idReceptor, String idEmisor);
}
