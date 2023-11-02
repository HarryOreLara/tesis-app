part of 'conversaciones_bloc.dart';

sealed class ConversacionesEvent extends Equatable {
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
