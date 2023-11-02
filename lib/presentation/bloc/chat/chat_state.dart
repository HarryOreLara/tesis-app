part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final bool loading;
  final String error;
  final bool add;
  final List<ChatModel> listChats;
  const ChatState(
      {this.loading = false,
      this.error = '',
      this.add = false,
      this.listChats = const []});

  ChatState copyWith(
          {bool? loading,
          String? error,
          bool? add,
          List<ChatModel>? listChats}) =>
      ChatState(
          loading: loading ?? this.loading,
          error: error ?? this.error,
          add: add ?? this.add,
          listChats: listChats ?? this.listChats);

  @override
  List<Object> get props => [loading, error, add, listChats];
}

final class ChatInitial extends ChatState {}
