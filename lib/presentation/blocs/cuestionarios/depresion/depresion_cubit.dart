import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesis_app/domain/entities/cuestionario/preguntas_puntuadas_depresion_entitie.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/infraestructure/datasources/cuestionarios/depresion_datasource_infra.dart';
import 'package:tesis_app/infraestructure/repositories/cuestionarios/depresion_repository_infra.dart';

part 'depresion_state.dart';

class DepresionCubit extends Cubit<DepresionState> {
  DepresionCubit() : super(const DepresionState());

  AuthService authService = AuthService();
  DepresionRepositoryInfra depresionRepositoryInfra =
      DepresionRepositoryInfra(DepresionDatasourceInfra());

  List<PreguntasPuntuadasDepresion> preguntasPuntuadas = [];

  bool sendRespuestasDepresion(
      String idPregunta, String contenido, bool respuesta) {
    final respuestasAcumuladas = PreguntasPuntuadasDepresion(
        idPregunta: idPregunta, contenido: contenido, respuesta: respuesta);
    preguntasPuntuadas.add(respuestasAcumuladas);
    if (validar() == true) {
      depresionRepositoryInfra.sendRespuestaDepresion(preguntasPuntuadas);
      return true;
    } else {
      return false;
    }
  }

  bool validar() {
    final numeracion = preguntasPuntuadas.length;
    if (numeracion == 15) {
      return true;
    } else {
      return false;
    }
  }
}
