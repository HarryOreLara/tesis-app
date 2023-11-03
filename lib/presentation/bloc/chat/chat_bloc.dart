import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/datasources/messages/chat_datasource_domain.dart';
import 'package:tesis_app/domain/datasources/profile/profile_datasource_domain.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/messages/chat_datasource_infra.dart';
import 'package:tesis_app/infraestructure/datasources/profile/profile_datasource_infra.dart';
import 'package:tesis_app/infraestructure/models/messages/chat_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  late ChatDatasourceDomain _chatDatasourceDomain;
  late ProfileDatasourceDomain _profileDatasourceDomain;
  ChatBloc() : super(const ChatState()) {
    _chatDatasourceDomain = ChatDatasourceInfra();
    _profileDatasourceDomain = ProfileDatasourceInfra();

    on<ChatInit>((event, emit) {
      emit(state.copyWith(add: false, loading: false, error: ''));
    });

    on<GetAllChats>((event, emit) async {
      final authService = AuthService();
      try {
        emit(state.copyWith(loading: true));
        final idUsuarioNull = await authService.getUserId();
        final idUsuario = idUsuarioNull ?? '';
        final idEmisor =
            await _profileDatasourceDomain.getOnePersona(idUsuario);

        ChatModel chatModel = ChatModel(
            id: "id",
            mensaje: "mensaje",
            leido: false,
            createdAt: "createdAt",
            emisor: idEmisor.id,
            receptor: event.idReceptor);
        final listChats =
            await _chatDatasourceDomain.getListChatsbyId(chatModel);
        emit(state.copyWith(loading: false, listChats: listChats));
      } catch (e) {
        try {
          emit(
              state.copyWith(loading: false, error: (e as dynamic)['message']));
        } catch (e) {
          emit(state.copyWith(
              loading: false, error: 'Ocurrio un error de segundo nivel'));
        }
      }
    });

    on<SendChat>((event, emit) async {
      final authService = AuthService();
      try {
        emit(state.copyWith(loading: true));
        final idUsuarioNull = await authService.getUserId();
        final idUsuario = idUsuarioNull ?? '';
        final idEmisor =
            await _profileDatasourceDomain.getOnePersona(idUsuario);

        ChatModel chatModel = ChatModel(
            id: "id",
            mensaje: event.mensaje,
            leido: false,
            createdAt: "createdAt",
            emisor: idEmisor.id,
            receptor: event.idReceptor);
        _chatDatasourceDomain.sendChat(chatModel);
        emit(state.copyWith(loading: false, add: true));
      } catch (e) {
        try {
          emit(
              state.copyWith(loading: false, error: (e as dynamic)['message']));
        } catch (e) {
          emit(state.copyWith(
              loading: false, error: 'Ocurrio un error de segundo nivel'));
        }
      }
    });
  }
}
