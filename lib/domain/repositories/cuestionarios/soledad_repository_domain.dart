import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_soledad_entitite.dart';

abstract class SoledadRepositoryDomain{
  Future<void> sendRespuestaSoledad(List<PreguntasPuntuadasSoledad> preguntasPuntuadasSoledad);

}