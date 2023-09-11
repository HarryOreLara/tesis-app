import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/messages/message_datasource_domain.dart';
import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/models/messages/chat_response.dart';

class MessageDatasourceInfra extends MessageDatasourceDomain {
  AuthService authService = AuthService();
  final dio = Dio(
    BaseOptions(
        baseUrl: 'https://tesis-xz3b.onrender.com',
        headers: {'Content-Type': 'application/json'}),
  );

  @override
  Future<void> sendMessage(Chat chat) async {
    try {
      final chatJson = chat.toJson();
      final response =
          await dio.post('/sendMessage/sendMessage', data: chatJson);
      final res = ChatResponse.fromJson(response.data);
      print(res.ok);
    } catch (e) {
      print(e);
    }
  }
}
