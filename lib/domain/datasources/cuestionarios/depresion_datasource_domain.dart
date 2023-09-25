
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_depresion_entitie.dart';

abstract class DepresionDatasourceDomain{
  Future<void> sendRespuestaDepresion(List<PreguntasPuntuadasDepresion> preguntasPuntuadasDepresion);

}