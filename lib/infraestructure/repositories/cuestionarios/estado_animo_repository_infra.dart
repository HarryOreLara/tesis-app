import 'package:tesis_app/domain/datasources/cuestionarios/estado_animo_datasource_domain.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_estadoanimo_entitie.dart';
import 'package:tesis_app/domain/repositories/cuestionarios/estado_animo_repository_domain.dart';

class EstadoAnimoRepositoryInfra extends EstadoAnimoRepositoryDomain {
  final EstadoAnimoDatasourceDomain estadoAnimoDatasourceDomain;
  EstadoAnimoRepositoryInfra(this.estadoAnimoDatasourceDomain);

  @override
  Future<void> sendRespuestaEstadoAnimo(
      List<PreguntasPuntuadasEstadoAnimo> preguntasPuntuadasEstadoanimo) {
    return estadoAnimoDatasourceDomain
        .sendRespuestaEstadoAnimo(preguntasPuntuadasEstadoanimo);
  }
}
