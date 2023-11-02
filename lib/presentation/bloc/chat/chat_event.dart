part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatInit extends ChatEvent {}

class GetAllChats extends ChatEvent {
  final String idReceptor;

  const GetAllChats({required this.idReceptor});
}

class SendChat extends ChatEvent {
  final String idReceptor;
  final String mensaje;

  const SendChat({required this.idReceptor, required this.mensaje});
}
