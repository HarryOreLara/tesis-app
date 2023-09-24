
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/messages/chat_datasource_infra.dart';
import 'package:tesis_app/infraestructure/datasources/profile/profile_datasource_infra.dart';
import 'package:tesis_app/infraestructure/mappers/chat_mapper.dart';
import 'package:tesis_app/infraestructure/repositories/messages/chat_repository_infra.dart';
import 'package:tesis_app/infraestructure/repositories/profile/profile_reposiroty_infra.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState());

  ChatRepositoryInfra chatRepositoryInfra =
      ChatRepositoryInfra(ChatDatasourceInfra());

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

    Chats chat = Chats(
        nombreReceptor: nombreReceptor, //l
        idEmisor: idEmisor, //l
        nombreEmisor: nombre,
        idReceptor: idReceptor);
    chatRepositoryInfra.saveChat(chat);
  }

//Lista de contactos con quien la persona conversa
  Future<List<Chats>> listChats() async {
    // final idUserNull = await authService.getUserId();
    // final idUser = idUserNull ?? "";
    // final profile = await profileRepositoryInfra.getOnePersona(idUser);
    // final idEmisor = profile.id;
    final idPersonaNull = await authService.getPersonaId();
    final idEmisor = idPersonaNull ?? '';
    final response = await chatRepositoryInfra.allChats(idEmisor);
    final List<Chats> listita =
        response.map((e) => ChatMapper.chatDbToEntity(e)).toList();
    return listita;
  }

  Future<bool> validarChat(String idReceptor) async {
    final idUserNull = await authService.getPersonaId();
    final idEmisor = idUserNull ?? "";
    final Chats chat = await chatRepositoryInfra.oneChat(idReceptor, idEmisor);
    if (chat.idEmisor == "") {
      return true;
    }
    return false;
  }
}
