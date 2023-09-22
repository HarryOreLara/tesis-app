import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/messages/message_datasource_domain.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/mappers/mensaje_mapper.dart';
import 'package:tesis_app/infraestructure/mappers/persona_mapper.dart';
import 'package:tesis_app/infraestructure/models/messages/mensaje_response.dart';
import 'package:tesis_app/infraestructure/models/messages/message_model.dart';
import 'package:tesis_app/infraestructure/models/user/persona_response.dart';

class MessageDatasourceInfra extends MessageDatasourceDomain {
  AuthService authService = AuthService();
  final dio = Dio(
    BaseOptions(
        baseUrl: 'https://tesis-xz3b.onrender.com',
        headers: {'Content-Type': 'application/json'}),
  );

  @override
  Future<void> sendMessage(MessageModel messageModel) async {
    try {
      final chatJson = messageModel.toJson();
      await dio.post('/sendMessage/mensaje', data: chatJson);
    } catch (e) {
      return;
    }
  }

  @override
  Future<List<MessageModel>> getListMessagesbyId(
      MessageModel messageModel) async {
    final chatJson = messageModel.toJson();
    final response = await dio.get('/sendMessage/msgList', data: chatJson);
    final res = MensajeResponse.fromJson(response.data);
    final List<MessageModel> mensajes = res.mensajeList
        .map((mensajesDB) => MensajeMapper.messageDbToEntity(mensajesDB))
        .toList();
    return mensajes;
  }


//Buscar la persona para inicar el chat
  @override
  Future<List<Profile>> searchPerson(String query) async {
    final response =
        await dio.get('/sendMessage/search/$query');
    final res = PersonaResponse.fromJson(response.data);
    final List<Profile> profile = res.personaList
        .map((profileDb) => PersonaMapper.personaDbToEntity(profileDb))
        .toList();
    return profile;
  }
}
