import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/entertainment/jokes_entitie.dart';
import 'package:tesis_app/infraestructure/datasources/entertainment/jokes_datasource_infra.dart';
import 'package:tesis_app/infraestructure/repositories/entertainment/jokes_reposotiry_infra.dart';
import 'dart:math';
part 'jokes_state.dart';

class JokesCubit extends Cubit<JokesState> {
  JokesCubit() : super(JokesInitial());

  JokeRepositoryInfra jokeRepositoryInfra =
      JokeRepositoryInfra(JokeDatasouserceInfra());

  int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  Future<Joke> getOneJoke() async {
    final id = generateRandomNumber(1, 240);
    final res = jokeRepositoryInfra.getOneJoke(id);
    return res;
  }

  Future<void> cargar(String seleccion, String id) async {
    return jokeRepositoryInfra.initCarga(seleccion, id);
  }
}
