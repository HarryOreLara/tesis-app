import 'package:tesis_app/domain/datasources/entertainment/jokes_datasource_domain.dart';
import 'package:tesis_app/domain/entities/entertainment/jokes_entitie.dart';

import 'package:tesis_app/domain/repositories/entertainment/jokes_repository_domain.dart';

class JokeRepositoryInfra extends JokeRepositoryDomain {
  final JokesDataSourceDomain jokesDataSourceDomain;

  JokeRepositoryInfra(this.jokesDataSourceDomain);

  @override
  Future<Joke> getOneJoke(int id) {
    return jokesDataSourceDomain.getOneJoke(id);
  }

  @override
  Future<void> initCarga(String seleccion, String id) {
    return jokesDataSourceDomain.initCarga(seleccion, id);
  }
}
