part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool loading;
  final String error;
  final bool add;
  final List<Usuario> listUsuario;
  const LoginState(
      {this.loading = false,
      this.error = '',
      this.add = false,
      this.listUsuario = const []});

  LoginState copyWith(
          {bool? loading,
          String? error,
          bool? add,
          List<Usuario>? listPersona}) =>
      LoginState(
          loading: loading ?? this.loading,
          error: error ?? this.error,
          add: add ?? this.add,
          listUsuario: listPersona ?? this.listUsuario);
  @override
  List<Object> get props => [loading, error, add, listUsuario];
}

final class LoginInitial extends LoginState {}
