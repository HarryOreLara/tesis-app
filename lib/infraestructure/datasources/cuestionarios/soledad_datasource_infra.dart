import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/cuestionarios/soledad_datasource_daomain.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_soledad_entitite.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';

class SoledadDatasourceInfra extends SoledadDatasourceDomain {
  AuthService authService = AuthService();
  final dio = Dio(BaseOptions(
      baseUrl: 'https://tesis-xz3b.onrender.com',
      headers: {'Content-Type': 'application/json'}));

  @override
  Future<void> sendRespuestaSoledad(
      List<PreguntasPuntuadasSoledad> preguntasPuntuadasSoledad) async {
    final idPersonaNull = await authService.getPersonaId();
    final idPersona = idPersonaNull ?? '';

    final preguntasPuntuadas = {
      "preguntasPuntuadas": preguntasPuntuadasSoledad
          .map((respuesta) => respuesta.toJson())
          .toList(),
    };

    await dio.post('/assistent/resSoledad/$idPersona',
        data: preguntasPuntuadas);

    preguntasPuntuadas.clear();
  }
}
