import 'package:tesis_app/domain/datasources/messages/conversaciones_datasource_domain.dart';
import 'package:tesis_app/domain/repositories/messages/conversaciones_repository_domain.dart';
import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';

class ChatRepositoryInfra extends ConversacionesRepositoryDomain {
  final ConversacionesDatasourceDomain chatDatasourceDomain;

  ChatRepositoryInfra(this.chatDatasourceDomain);

  @override
  Future<void> saveChat(ConversacionesModel chats) {
    return chatDatasourceDomain.saveChat(chats);
  }

  @override
  Future<List<ConversacionesModel>> allChats(String idEmisor) {
    return chatDatasourceDomain.allChats(idEmisor);
  }

  @override
  Future<ConversacionesModel> oneChat(String idReceptor, String idEmisor) {
    return chatDatasourceDomain.oneChat(idReceptor, idEmisor);
  }
}
