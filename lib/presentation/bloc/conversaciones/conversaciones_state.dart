part of 'conversaciones_bloc.dart';

class ConversacionesState extends Equatable {
  final bool loading;
  final String error;
  final bool add;
  final List<ConversacionesModel> listConversaciones;
  const ConversacionesState(
      {this.loading = false,
      this.error = "",
      this.add = false,
      this.listConversaciones = const []});

  ConversacionesState copyWith(
          {bool? loading,
          String? error,
          bool? add,
          List<ConversacionesModel>? listConversaciones}) =>
      ConversacionesState(
          loading: loading ?? this.loading,
          error: error ?? this.error,
          add: add ?? this.add,
          listConversaciones: listConversaciones ?? this.listConversaciones);

  @override
  List<Object> get props => [loading, error, add, listConversaciones];
}

final class ConversacionesInitial extends ConversacionesState {}
