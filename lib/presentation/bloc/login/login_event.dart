part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginInit extends LoginEvent {}

class GetOneUsuario extends LoginEvent {
  final String id;
  const GetOneUsuario({required this.id});
}

class GetAllUsuarios extends LoginEvent {}

class RegisterUsuario extends LoginEvent {
  final Usuario usuario;

  const RegisterUsuario({required this.usuario});
}

class LoginUsuario extends LoginEvent {
  final Usuario usuario;

  const LoginUsuario({required this.usuario});
}
