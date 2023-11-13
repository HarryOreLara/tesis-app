import 'package:dio/dio.dart';
import 'package:tesis_app/domain/datasources/cuestionarios/depresion_datasource_domain.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_depresion_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/profile/profile_datasource_infra.dart';

//DEPRESION TIENE 15 PREGUNTAS Y EL DE SI O NO
class DepresionDatasourceInfra extends DepresionDatasourceDomain {
  AuthService authService = AuthService();
  ProfileDatasourceInfra profileDatasourceInfra = ProfileDatasourceInfra();

  final dio = Dio(BaseOptions(
      baseUrl: 'https://tesis-xz3b.onrender.com',
      headers: {'Content-Type': 'application/json'}));
  @override
  Future<void> sendRespuestaDepresion(
      List<PreguntasPuntuadasDepresion> preguntasPuntuadasDepresion) async {
    final idUsuarioNull = await authService.getUserId();
    final idUsuario = idUsuarioNull ?? '';
    final idPersona = await profileDatasourceInfra.getOnePersona(idUsuario);

    final preguntasPuntuadas = {
      "preguntasPuntuadas": preguntasPuntuadasDepresion
          .map((respuesta) => respuesta.toJson())
          .toList(),
      "createdAt": DateTime.now().toString()
    };

    await dio.post('/assistent/resDepresion/$idPersona',
        data: preguntasPuntuadas);

    preguntasPuntuadasDepresion.clear();
    preguntasPuntuadas.clear();
  }
}
