// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:tesis_app/infraestructure/auth/auth_service.dart';

// import 'package:tesis_app/infraestructure/datasources/medicines_datasource_infra.dart';
// import 'package:tesis_app/infraestructure/datasources/messages/message_datasource_infra.dart';
// import 'package:tesis_app/infraestructure/formularios/inputs/inputs.dart';
// import 'package:formz/formz.dart';
// import 'package:tesis_app/infraestructure/models/messages/chat_model.dart';
// import 'package:tesis_app/infraestructure/repositories/medicine_repository_infra.dart';
// part 'message_state.dart';

// class MessageCubit extends Cubit<MessageState> {
//   MessageCubit() : super(const MessageState());
//   AuthService authService = AuthService();
//   MedicineRepositoryInfra medicineRepositoryInfra =
//       MedicineRepositoryInfra(MedicineDbDatasourceInfra());

//   Future<void> sendMessage(String idReceptor) async {
//     ChatDatasourceInfra messageDatasourceInfra = ChatDatasourceInfra();
//     final authService = AuthService();
//     final idPersonaNullable = await authService.getPersonaId();
//     final idEmisor = idPersonaNullable ?? "";
//     final message = state.messageText.value;
//     ChatModel chatModel = ChatModel(
//         mensaje: message,
//         idEmisor: idEmisor,
//         idReceptor: idReceptor,
//         leido: false);
//     try {
//       messageDatasourceInfra.sendMessage(ChatModel);
//       final mensajesActualizado = await getMensajesByUser(idReceptor);
//       emit(MessageLoadSuccess(mensajesActualizado));
//     } catch (e) {
//       return;
//     }
//   }

//   Future<List<ChatModel>> getMensajesByUser(String idReceptor) async {
//     ChatDatasourceInfra messageDatasourceInfra = ChatDatasourceInfra();
//     final idUserNull = await authService.getPersonaId();
//     final idEmisor = idUserNull ?? "";
//     ChatModel chatModel = ChatModel(
//         mensaje: "message",
//         idEmisor: idEmisor,
//         idReceptor: idReceptor,
//         leido: false);
//     final res = await messageDatasourceInfra.getListMessagesbyId(ChatModel);
//     return res;
//   }

//   void messageChange(String value) {
//     final messageText = MessageText.dirty(value);
//     emit(state.copyWith(
//         messageText: messageText, isValid: Formz.validate([messageText])));
//   }
// }

// class MessageLoadSuccess extends MessageState {
//   final List<ChatModel> mensajes;

//   const MessageLoadSuccess(this.mensajes);

//   @override
//   List<Object> get props => [mensajes];
// }
