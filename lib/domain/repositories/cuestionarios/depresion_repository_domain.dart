import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_depresion_entitie.dart';

abstract class DepresionRepositoryDomain{
    Future<void> sendRespuestaDepresion(List<PreguntasPuntuadasDepresion> preguntasPuntuadasDepresion);

}