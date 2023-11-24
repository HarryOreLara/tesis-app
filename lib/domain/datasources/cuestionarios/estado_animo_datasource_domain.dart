import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_estadoanimo_entitie.dart';

abstract class EstadoAnimoDatasourceDomain {
  Future<void> sendRespuestaEstadoAnimo(
      List<PreguntasPuntuadasEstadoAnimo> preguntasPuntuadasEstadoanimo);
}
