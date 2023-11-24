import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_estadoanimo_entitie.dart';

abstract class EstadoAnimoRepositoryDomain {
  Future<void> sendRespuestaEstadoAnimo(
      List<PreguntasPuntuadasEstadoAnimo> preguntasPuntuadasEstadoanimo);
}
