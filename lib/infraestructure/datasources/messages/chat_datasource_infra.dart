import 'package:dio/dio.dart';
import 'package:tesis_app/config/errors/exception.dart';
import 'package:tesis_app/domain/datasources/messages/chat_datasource_domain.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/mappers/mensaje_mapper.dart';
import 'package:tesis_app/infraestructure/mappers/persona_mapper.dart';
import 'package:tesis_app/infraestructure/models/messages/mensaje_response.dart';
import 'package:tesis_app/infraestructure/models/messages/chat_model.dart';
import 'package:tesis_app/infraestructure/models/user/persona_response.dart';

class ChatDatasourceInfra extends ChatDatasourceDomain {
  AuthService authService = AuthService();
  final dio = Dio(
    BaseOptions(
        baseUrl: 'https://tesis-xz3b.onrender.com',
        headers: {'Content-Type': 'application/json'}),
  );

  @override
  Future<void> sendChat(ChatModel messageModel) async {
    try {
      final response =
          await dio.post('/sendMessage/mensaje', data: messageModel.toMap());
      if (response.statusCode != 200) {
        throw APIException(
            message: response.statusMessage, statusCode: response.statusCode);
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<ChatModel>> getListChatsbyId(ChatModel messageModel) async {
    try {
      final chatJson = messageModel.toJson();
      final response = await dio.get('/sendMessage/msgList', data: chatJson);
      final res = MensajeResponse.fromJson(response.data);
      final List<ChatModel> mensajes = res.mensajeList
          .map((mensajesDB) => ChatMapper.messageDbToEntity(mensajesDB))
          .toList();
      return mensajes;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

//Buscar la persona para inicar el chat
  @override
  Future<List<Profile>> searchPerson(String query) async {
    final response = await dio.get('/sendMessage/search/$query');
    final res = PersonaResponse.fromJson(response.data);
    final List<Profile> profile = res.personaList
        .map((profileDb) => PersonaMapper.personaDbToEntity(profileDb))
        .toList();
    return profile;
  }
}
