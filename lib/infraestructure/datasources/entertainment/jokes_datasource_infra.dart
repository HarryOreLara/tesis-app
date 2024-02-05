import 'package:dio/dio.dart';
import 'package:tesis_app/config/constants/enviroment.dart';
import 'package:tesis_app/domain/datasources/entertainment/jokes_datasource_domain.dart';
import 'package:tesis_app/domain/entities/entertainment/jokes_entitie.dart';
import 'package:tesis_app/domain/entities/votos_entitie.dart';

class JokeDatasouserceInfra extends JokesDataSourceDomain {
  final dio =
      Dio(BaseOptions(baseUrl: Enviroment.apiUrl, headers: {
    'Content-Type': 'application/json',
    'x-auth-token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTJhNjgxMWUzNTBkOWIxYzFjMmZhZSIsImlhdCI6MTY5MjU3NTM2MX0.5rES-UtmnEAJZonUqPQ9cHll30wsNSY8zUVzIqXn5zo'
  }));

  @override
  Future<Joke> getOneJoke(int id) async {
    final response = await dio.get('/joke/getOneNum/$id');
    final jsonData = response.data as Map<String, dynamic>;
    final jokeList = jsonData['joke'] as List<dynamic>;
    final firstJoke = jokeList.first as Map<String, dynamic>;

    final votitos = Votos(
        likes: firstJoke['votos']['likes'],
        dislikes: firstJoke['votos']['dislikes']);

    final joke = Joke(
        votos: votitos,
        id: firstJoke['_id'] ?? '',
        contenido: firstJoke['contenido'] ?? '',
        categoria: firstJoke['categoria'] ?? '',
        autor: firstJoke['autor'] ?? '',
        nivelDificultad: firstJoke['nivelDificultad'] ?? '',
        idioma: firstJoke['idioma'] ?? '',
        popularidad: firstJoke['popularidad'] ?? '',
        fuente: firstJoke['fuente'] ?? '',
        imagenUrl: firstJoke['imagenUrl'],
        numeroDocumento: firstJoke['numeroDocumento'] ?? '',
        createdAt: DateTime.parse(firstJoke['createdAt']!),
        v: firstJoke['v'] ?? 0);

    return joke;
  }

  @override
  Future<void> initCarga(String seleccion, String id) async {
     await dio.post('/voto/$seleccion/$id');
  }
}
