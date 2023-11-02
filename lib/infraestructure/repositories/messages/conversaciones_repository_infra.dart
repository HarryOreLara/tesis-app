import 'package:tesis_app/domain/datasources/messages/conversaciones_datasource_domain.dart';
import 'package:tesis_app/domain/repositories/messages/conversaciones_repository_domain.dart';
import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';

class ChatRepositoryInfra extends ConversacionesRepositoryDomain {
  final ConversacionesDatasourceDomain chatDatasourceDomain;

  ChatRepositoryInfra(this.chatDatasourceDomain);

  @override
  Future<void> saveConversaciones(ConversacionesModel chats) {
    return chatDatasourceDomain.saveConversaciones(chats);
  }

  @override
  Future<List<ConversacionesModel>> allConversaciones(String idEmisor) {
    return chatDatasourceDomain.allConversaciones(idEmisor);
  }

  @override
  Future<ConversacionesModel> oneConversacion(String idReceptor, String idEmisor) {
    return chatDatasourceDomain.oneConversacion(idReceptor, idEmisor);
  }
}
