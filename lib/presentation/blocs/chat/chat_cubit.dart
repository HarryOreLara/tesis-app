import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/messages/conversaciones_datasource_infra.dart';
import 'package:tesis_app/infraestructure/datasources/profile/profile_datasource_infra.dart';
import 'package:tesis_app/infraestructure/mappers/conversaciones_mapper.dart';
import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';
import 'package:tesis_app/infraestructure/repositories/messages/chat_repository_infra.dart';
import 'package:tesis_app/infraestructure/repositories/profile/profile_reposiroty_infra.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState());

  ChatRepositoryInfra chatRepositoryInfra =
      ChatRepositoryInfra(ConversacionesDatasourceInfra());

  ProfileRepositoryInfra profileRepositoryInfra =
      ProfileRepositoryInfra(ProfileDatasourceInfra());

  AuthService authService = AuthService();

  Future<void> saveChat(String idReceptor, String nombreReceptor) async {
    final idPersonaNull = await authService.getPersonaId();
    final idEmisor = idPersonaNull ?? '';

    final idUserNull = await authService.getUserId();
    final idUser = idUserNull ?? "";
    final profile = await profileRepositoryInfra.getOnePersona(idUser);
    final nombre = profile.nombre;

    ConversacionesModel chat = ConversacionesModel(
        nombreReceptor: nombreReceptor, //l
        idEmisor: idEmisor, //l
        nombreEmisor: nombre,
        idReceptor: idReceptor);
    chatRepositoryInfra.saveChat(chat);
  }

//Lista de contactos con quien la persona conversa
  Future<List<ConversacionesModel>> listChats() async {
    final idPersonaNull = await authService.getPersonaId();
    final idEmisor = idPersonaNull ?? '';
    final response = await chatRepositoryInfra.allChats(idEmisor);
    final List<ConversacionesModel> listita =
        response.map((e) => ConversacionesMapper.chatDbToEntity(e)).toList();
    return listita;
  }

  Future<bool> validarChat(String idReceptor) async {
    final idUserNull = await authService.getPersonaId();
    final idEmisor = idUserNull ?? "";
    final ConversacionesModel chat =
        await chatRepositoryInfra.oneChat(idReceptor, idEmisor);
    if (chat.idEmisor == "") {
      return true;
    }
    return false;
  }
}
