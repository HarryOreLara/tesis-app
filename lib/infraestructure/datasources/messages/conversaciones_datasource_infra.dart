import 'package:dio/dio.dart';
import 'package:tesis_app/config/constants/enviroment.dart';
import 'package:tesis_app/domain/datasources/messages/conversaciones_datasource_domain.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/mappers/conversaciones_mapper.dart';
import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';
import 'package:tesis_app/infraestructure/models/messages/conversaciones_list_response.dart';

class ConversacionesDatasourceInfra extends ConversacionesDatasourceDomain {
  AuthService authService = AuthService();

  final dio = Dio(BaseOptions(
      baseUrl: Enviroment.apiUrl,
      headers: {'Content-Type': 'application/json', 'x-auth-token': 'token'}));

  @override
  Future<void> saveConversaciones(ConversacionesModel chats) async {
    final chatJson = chats.toJson();
    dio.post('/chat/newChat', data: chatJson);
  }

  @override
  Future<List<ConversacionesModel>> allConversaciones(String idEmisor) async {
    final response = await dio.get('/chat/allChats/$idEmisor');
    final res = ConversacionestListResponse.fromJson(response.data);
    final List<ConversacionesModel> listChats = res.listChats
        .map((chatDb) => ConversacionesMapper.chatDbToEntity(chatDb))
        .toList();
    return listChats;
  }

  @override
  Future<ConversacionesModel> oneConversacion(
      String idReceptor, String idEmisor) async {
    final response = await dio.get('/chat/oneChat/$idEmisor/$idReceptor');
    final res = ConversacionestListResponse.fromJson(response.data);
    final List<ConversacionesModel> listChats = res.listChats;
    final ConversacionesModel chats =
        ConversacionesMapper.chatDbToEntity(listChats[0]);
    return chats;
  }
}
