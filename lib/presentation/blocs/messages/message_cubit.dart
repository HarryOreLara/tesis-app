import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';

import 'package:tesis_app/infraestructure/datasources/medicines_datasource_infra.dart';
import 'package:tesis_app/infraestructure/datasources/messages/message_datasource_infra.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';
import 'package:formz/formz.dart';
import 'package:tesis_app/infraestructure/models/messages/message_model.dart';
import 'package:tesis_app/infraestructure/repositories/medicine_repository_infra.dart';
part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(const MessageState());
  AuthService authService = AuthService();
  MedicineRepositoryInfra medicineRepositoryInfra =
      MedicineRepositoryInfra(MedicineDbDatasourceInfra());

  Future<void> sendMessage(String idReceptor) async {
    MessageDatasourceInfra messageDatasourceInfra = MessageDatasourceInfra();
    final authService = AuthService();
    final idPersonaNullable = await authService.getPersonaId();
    final idEmisor = idPersonaNullable ?? "";
    final message = state.messageText.value;
    MessageModel messageModel = MessageModel(
        mensaje: message, emisor: idEmisor, receptor: idReceptor, leido: false);
    try {
      messageDatasourceInfra.sendMessage(messageModel);
    } catch (e) {
      return;
    }
  }

  Future<List<MessageModel>> getMensajesByUser(String idReceptor) async {
    MessageDatasourceInfra messageDatasourceInfra = MessageDatasourceInfra();
    final idUserNull = await authService.getPersonaId();
    final idEmisor = idUserNull ?? "";
    MessageModel messageModel = MessageModel(
        mensaje: "message",
        emisor: idEmisor,
        receptor: idReceptor,
        leido: false);
    final res = await messageDatasourceInfra.getListMessagesbyId(messageModel);
    return res;
  }

  void messageChange(String value) {
    final messageText = MessageText.dirty(value);
    emit(state.copyWith(
        messageText: messageText, isValid: Formz.validate([messageText])));
  }
}
