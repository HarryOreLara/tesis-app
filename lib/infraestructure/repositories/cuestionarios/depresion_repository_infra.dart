import 'package:tesis_app/domain/datasources/cuestionarios/depresion_datasource_domain.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_depresion_entitie.dart';
import 'package:tesis_app/domain/repositories/cuestionarios/depresion_repository_domain.dart';

class DepresionRepositoryInfra extends DepresionRepositoryDomain {
  final DepresionDatasourceDomain depresionDatasourceDomain;

  DepresionRepositoryInfra(this.depresionDatasourceDomain);

  @override
  Future<void> sendRespuestaDepresion(
      List<PreguntasPuntuadasDepresion> preguntasPuntuadasDepresion) {
    return depresionDatasourceDomain
        .sendRespuestaDepresion(preguntasPuntuadasDepresion);
  }
}
