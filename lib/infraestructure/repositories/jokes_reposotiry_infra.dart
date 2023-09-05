import 'package:tesis_app/domain/entities/jokes_entitie.dart';

import 'package:tesis_app/domain/repositories/jokes_repository_domain.dart';

class JokeRepositoryInfra extends JokeRepositoryDomain {
  final JokeRepositoryDomain jokeRepositoryDomain;

  JokeRepositoryInfra(this.jokeRepositoryDomain);

  @override
  Future<Joke> getOneJoke(int id) {
    throw UnimplementedError();
  }
}
