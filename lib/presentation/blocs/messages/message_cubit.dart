import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/messages/message_entitie.dart';
import 'package:tesis_app/domain/entities/messages/user_message_entitie.dart';

import 'package:tesis_app/infraestructure/datasources/messages/message_datasource_infra.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';
import 'package:formz/formz.dart';
part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(const MessageState());

  Future<void> sendMessage(String room, User user) async {
    MessageDatasourceInfra messageDatasourceInfra = MessageDatasourceInfra();
    final datTime = DateTime.now();
    final datString = datTime.toString();
    final message = state.messageText.value;
    Message newMessage =
        Message(sender: user, time: datString, text: message, leido: false);

    try {
      final res = messageDatasourceInfra.sendMessage(newMessage);
      print(res);
    } catch (e) {}
  }

  void messageChange(String value) {
    final messageText = MessageText.dirty(value);
    emit(state.copyWith(
        messageText: messageText, isValid: Formz.validate([messageText])));
  }
}
