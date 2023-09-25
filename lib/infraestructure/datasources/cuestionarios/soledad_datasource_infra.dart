import 'package:tesis_app/domain/datasources/cuestionarios/soledad_datasource_daomain.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_soledad_entitite.dart';

class SoledadDatasourceInfra extends SoledadDatasourceDomain{
  @override
  Future<void> sendRespuestaSoledad(List<PreguntasPuntuadasSoledad> preguntasPuntuadasSoledad) {
    throw UnimplementedError();
  }

}