import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';
//import 'package:socket_io_client/socket_io_client.dart';
//import 'package:web_socket_channel/io.dart';
import 'package:tesis_app/infraestructure/datasources/messages/message_datasource_infra.dart';
import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';
import 'package:formz/formz.dart';
part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  // final Socket socket =
  //     io('https://tesis-xz3b.onrender.com/sendMessage/sendMessage');
  MessageCubit() : super(const MessageState());

  Future<void> sendMessage(String room) async {
    MessageDatasourceInfra messageDatasourceInfra = MessageDatasourceInfra();
    //final channel = IOWebSocketChannel.connect('ws://your-server-ip:3000');
    //socket.connect();
    final message = state.messageText.value;
    Chat chat = Chat(message: message, room: room);
    try {
      final res = messageDatasourceInfra.sendMessage(chat);
      print(res);
      //var res = socket.emit('message', {'message': message, 'room': room});
    } catch (e) {
      print(e);
    }
  }

  void messageChange(String value) {
    final messageText = MessageText.dirty(value);
    emit(state.copyWith(
        messageText: messageText, isValid: Formz.validate([messageText])));
  }
}
