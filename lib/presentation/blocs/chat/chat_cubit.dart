import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/messages/chat_datasource_infra.dart';
import 'package:tesis_app/infraestructure/datasources/profile/profile_datasource_infra.dart';
import 'package:tesis_app/infraestructure/repositories/messages/chat_repository_infra.dart';
import 'package:tesis_app/infraestructure/repositories/profile/profile_reposiroty_infra.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState());

  ChatRepositoryInfra chatRepositoryInfra =
      ChatRepositoryInfra(ChatDatasourceInfra());

  ProfileRepositoryInfra profileRepositoryInfra = ProfileRepositoryInfra(ProfileDatasourceInfra());

  AuthService authService = AuthService();

  Future<void> saveChat(String idReceptor, String nombreReceptor) async {
    final idPersonaNullable = await authService.getUserId();
    final idEmisor = idPersonaNullable ?? "";
    final Profile profile =await profileRepositoryInfra.getOnePersona(idEmisor);
    final nombre = profile.nombre.toString();

    Chats chat = Chats(
        nombreReceptor: nombreReceptor,
        idEmisor: idEmisor,
        nombreEmisor: nombre,
        idReceptor: idReceptor);
    chatRepositoryInfra.saveChat(chat);
  }



}
