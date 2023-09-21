import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/messages/chat_datasource_domain.dart';
import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';
import 'package:tesis_app/infraestructure/mappers/chat_mapper.dart';
import 'package:tesis_app/infraestructure/models/messages/chat_list_response.dart';

class ChatDatasourceInfra extends ChatDatasourceDomain {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://tesis-xz3b.onrender.com',
      headers: {'Content-Type': 'application/json', 'x-auth-token': 'token'}));
  @override
  Future<void> saveChat(Chats chats) async {
    final chatJson = chats.toJson();
    final res = await dio.post('/chat/newChat', data: chatJson);
    print(res);
  }

  @override
  Future<List<Chats>> allChats(String idEmisor) async {
    final response = await dio.get('/chat/allChats/$idEmisor');
    final res = ChatListResponse.fromJson(response.data);
    final List<Chats> listChats = res.listChats
        .map((chatDb) => ChatMapper.chatDbToEntity(chatDb))
        .toList();
    return listChats;
  }

  @override
  Future<Chats> oneChat(String idReceptor, String idEmisor) {
    // TODO: implement oneChat
    throw UnimplementedError();
  }
}
