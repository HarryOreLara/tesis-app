
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_soledad_entitite.dart';

abstract class SoledadDatasourceDomain{
  Future<void> sendRespuestaSoledad(List<PreguntasPuntuadasSoledad> preguntasPuntuadasSoledad);

}