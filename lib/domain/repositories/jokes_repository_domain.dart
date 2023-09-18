import 'package:tesis_app/domain/entities/jokes_entitie.dart';

abstract class JokeRepositoryDomain {
  Future<Joke> getOneJoke(int id);

  Future<void> initCarga(String seleccion, String id);
}
