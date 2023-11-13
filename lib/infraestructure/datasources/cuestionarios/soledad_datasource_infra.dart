import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/cuestionarios/soledad_datasource_daomain.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_soledad_entitite.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/profile/profile_datasource_infra.dart';

class SoledadDatasourceInfra extends SoledadDatasourceDomain {
  AuthService authService = AuthService();
  ProfileDatasourceInfra profileDatasourceInfra = ProfileDatasourceInfra();

  final dio = Dio(BaseOptions(
      baseUrl: 'https://tesis-xz3b.onrender.com',
      headers: {'Content-Type': 'application/json'}));

  @override
  Future<void> sendRespuestaSoledad(
      List<PreguntasPuntuadasSoledad> preguntasPuntuadasSoledad) async {
    final idUsuarioNull = await authService.getUserId();
    final idUsuario = idUsuarioNull ?? '';
    final idPersona = await profileDatasourceInfra.getOnePersona(idUsuario);

    final preguntasPuntuadas = {
      "preguntasPuntuadas": preguntasPuntuadasSoledad
          .map((respuesta) => respuesta.toJson())
          .toList(),
      "createdAt": DateTime.now().toString()
    };

    await dio.post('/assistent/resSoledad/$idPersona',
        data: preguntasPuntuadas);

    preguntasPuntuadasSoledad.clear();
    preguntasPuntuadas.clear();
  }
}
