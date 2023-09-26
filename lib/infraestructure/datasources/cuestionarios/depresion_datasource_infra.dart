import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/cuestionarios/depresion_datasource_domain.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_depresion_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';

class DepresionDatasourceInfra extends DepresionDatasourceDomain {
  AuthService authService = AuthService();
  final dio = Dio(BaseOptions(
      baseUrl: 'https://tesis-xz3b.onrender.com',
      headers: {'Content-Type': 'application/json'}));
  @override
  Future<void> sendRespuestaDepresion(
      List<PreguntasPuntuadasDepresion> preguntasPuntuadasDepresion) async {
    final idPersonaNull = await authService.getPersonaId();
    final idPersona = idPersonaNull ?? '';

    final preguntasPuntuadas = {
      "preguntasPuntuadas": preguntasPuntuadasDepresion
          .map((respuesta) => respuesta.toJson())
          .toList(),
    };

    await dio.post('/assistent/resDepresion/$idPersona',
        data: preguntasPuntuadas);

    preguntasPuntuadasDepresion.clear();
  }
}
