part of 'conversaciones_bloc.dart';

abstract class ConversacionesEvent extends Equatable {
  const ConversacionesEvent();

  @override
  List<Object> get props => [];
}

class ConversacionesInit extends ConversacionesEvent {}

class GetOneConversacion extends ConversacionesEvent {
  final String id;

  const GetOneConversacion({required this.id});
}

class GetAllConversaciones extends ConversacionesEvent {}

class SaveConversaciones extends ConversacionesEvent {
  final String idReceptor;
  final String nombreReceptor;

  const SaveConversaciones(
      {required this.idReceptor, required this.nombreReceptor});
}
