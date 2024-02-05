import 'package:dio/dio.dart';
import 'package:tesis_app/config/constants/enviroment.dart';
import 'package:tesis_app/domain/datasources/cuestionarios/estado_animo_datasource_domain.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_estadoanimo_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/profile/profile_datasource_infra.dart';

class EstadoAnimoDatasourceInfra extends EstadoAnimoDatasourceDomain {
  AuthService authService = AuthService();
  ProfileDatasourceInfra profileDatasourceInfra = ProfileDatasourceInfra();

    final dio = Dio(BaseOptions(
      baseUrl: Enviroment.apiUrl,
      headers: {'Content-Type': 'application/json'}));

  @override
  Future<void> sendRespuestaEstadoAnimo(
      List<PreguntasPuntuadasEstadoAnimo> preguntasPuntuadasEstadoanimo)async {
    // TODO: implement sendRespuestaEstadoAnimo
    throw UnimplementedError();
  }
}
