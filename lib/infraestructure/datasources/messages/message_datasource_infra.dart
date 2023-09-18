import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/messages/message_datasource_domain.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/mappers/mensaje_mapper.dart';
import 'package:tesis_app/infraestructure/models/messages/chat_response.dart';
import 'package:tesis_app/infraestructure/models/messages/mensaje_response.dart';
import 'package:tesis_app/infraestructure/models/messages/message_model.dart';

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

      final response = await dio.post('/sendMessage/mensaje', data: chatJson);
      final res = ChatResponse.fromJson(response.data);
      print(res.ok);
    } catch (e) {
      return;
    }
  }

  @override
  Future<List<MessageModel>> getListMessagesbyId(
      MessageModel messageModel) async {
    //final List<MessageModel> listaVacia = [];

    final chatJson = messageModel.toJson();
    final response = await dio.get('/sendMessage/msgList', data: chatJson);
    final res = MensajeResponse.fromJson(response.data);
    final List<MessageModel> mensajes = res.mensajeList
        .map((mensajesDB) => MensajeMapper.messageDbToEntity(mensajesDB))
        .toList();
    return mensajes;
  }


}