import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tesis_app/infraestructure/datasources/medicines_datasource_infra.dart';
import 'package:tesis_app/infraestructure/datasources/messages/message_datasource_infra.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';
import 'package:formz/formz.dart';
import 'package:tesis_app/infraestructure/models/messages/message_model.dart';
import 'package:tesis_app/infraestructure/repositories/medicine_repository_infra.dart';
part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(const MessageState());

  MedicineRepositoryInfra medicineRepositoryInfra =
      MedicineRepositoryInfra(MedicineDbDatasourceInfra());

  Future<void> sendMessage() async {
    MessageDatasourceInfra messageDatasourceInfra = MessageDatasourceInfra();
    final message = state.messageText.value;
    MessageModel messageModel = MessageModel(
        mensaje: message, emisor: "idHarry", receptor: "idElisa", leido: false);

    try {
      //final res = messageDatasourceInfra.sendMessage(newMessage);
      final res = messageDatasourceInfra.sendMessage(messageModel);
      print(res);
    } catch (e) {}
  }

  //Para obtener la lista de mensajes
  Future<List<MessageModel>> getMensajesByUser() async {
    MessageDatasourceInfra messageDatasourceInfra = MessageDatasourceInfra();
    MessageModel messageModel = MessageModel(
        mensaje: "message",
        emisor: "idHarry",
        receptor: "idElisa",
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
