import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_estadoanimo_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/cuestionarios/estado_animo_datasource_infra.dart';
import 'package:tesis_app/infraestructure/repositories/cuestionarios/estado_animo_repository_infra.dart';

part 'estado_animo_state.dart';

class EstadoAnimoCubit extends Cubit<EstadoAnimoState> {
  EstadoAnimoCubit() : super(EstadoAnimoInitial());

  AuthService authService = AuthService();
  EstadoAnimoRepositoryInfra estadoAnimoRepositoryInfra =
      EstadoAnimoRepositoryInfra(EstadoAnimoDatasourceInfra());

  List<PreguntasPuntuadasEstadoAnimo> preguntas = [];

  bool sendRespuestaEstadoAnimo(
      String idPregunta, String contenido, String respuesta) {
    final respuestasAcumuladas = PreguntasPuntuadasEstadoAnimo(
        idPregunta: idPregunta, contenido: contenido, respuesta: respuesta);
    preguntas.add(respuestasAcumuladas);
    if (validar() == true) {
      estadoAnimoRepositoryInfra.sendRespuestaEstadoAnimo(preguntas);
      return true;
    } else {
      return false;
    }
  }

  bool validar() {
    final numeracion = preguntas.length;
    if (numeracion > 8) {
      return true;
    } else {
      return false;
    }
  }
}
