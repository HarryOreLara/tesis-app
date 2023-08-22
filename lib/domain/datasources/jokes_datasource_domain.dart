import 'package:tesis_app/domain/entities/jokes_entitie.dart';

abstract class JokesDataSourceDomain {

  Future<Joke> getOneJoke(int id);

}
