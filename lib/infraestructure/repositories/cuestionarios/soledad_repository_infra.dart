import 'package:tesis_app/domain/datasources/cuestionarios/soledad_datasource_daomain.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_soledad_entitite.dart';
import 'package:tesis_app/domain/repositories/cuestionarios/soledad_repository_domain.dart';

class SoledadRepositoryInfra extends SoledadRepositoryDomain {
  final SoledadDatasourceDomain soledadDatasourceDomain;

  SoledadRepositoryInfra(this.soledadDatasourceDomain);

  @override
  Future<void> sendRespuestaSoledad(
      List<PreguntasPuntuadasSoledad> preguntasPuntuadasSoledad) {
    return soledadDatasourceDomain
        .sendRespuestaSoledad(preguntasPuntuadasSoledad);
  }
}
