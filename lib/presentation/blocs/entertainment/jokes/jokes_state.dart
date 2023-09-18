part of 'jokes_cubit.dart';

sealed class JokesState extends Equatable {
  const JokesState();

  @override
  List<Object> get props => [];
}

final class JokesInitial extends JokesState {}
